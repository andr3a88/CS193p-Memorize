# Stanford University - CS193p
CS193p (Developing Applications for iOS using SwiftUI)

## Lecture 1

### Course Logistics and Intro to SwiftUI

After going over the mechanics of how the course works, this first lecture dives right into creating an iOS application (a card-matching game called Memorize).  The Xcode development environment is used to demonstrate the basics of SwiftUI's declarative approach to composing user-interfaces.

+ [Watch Video](https://youtu.be/jbtqIBpUG7g)
+ [Slides](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/l1.pdf)


## Lecture 2

### MVVM and the Swift Type System

Conceptual overview of the architectural paradigm underlying the development of applications for iOS using SwiftUI: MVVM.  In addition, a key underpinning of the Swift Programming Language, its type system, is explained.  The Memorize demonstration continues, incorporating MVVM.

+ [Watch Video](https://youtu.be/4GjXq2Sr55Q)
+ [Slides](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/l2.pdf)
+ [Reading 1](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/r1.pdf)
+ [Assignment 1](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/a1.pdf)

#### MVVM
![MVVM](./slides/mvvm.png)

#### Struct vs Class
![Struct vs class](./slides/struct_class.png)

## Lecture 3

### Reactive UI Protocols Layout

Now that MVVM has been applied to Memorize, we can use the reactive nature of SwiftUI to make the cards flip over by processing multitouch events, updating our Model through our ViewModel and having our UI stay in sync with our Model at all times.  An important concept, protocols, is covered in more detail as well as the basics about how to lay out Views in the UI.

+ [Watch Video](https://www.youtube.com/watch?v=SIYdYpPXil4&list=PLpGHT1n4-mAtTj9oywMWoBx0dCGd51_yG&index=4&t=0s) 
+ [Slides](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/l3_0.pdf)

#### Struct vs Class
![Geometry Reader](./slides/geometry_reader.png)

## Lecture 4

### Grid enum Optionals

The survey of the Swift type system completes with a discussion of enum.  An important language construct, Optionals, is both explained in slides and then demonstrated in Memorize as we fully implement the logic of the game.

+ [Watch Video](https://www.youtube.com/watch?v=eHEeWzFP6O4&list=PLpGHT1n4-mAtTj9oywMWoBx0dCGd51_yG&index=4)
+ [Slides](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/l4.pdf)
+ [GridLayout.swift](https://cs193p.stanford.edu/Spring2020/GridLayout.swift.zip)
+ [Reading 2](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/r2_0.pdf)
+ [Assignment 2](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/a2_0.pdf)

#### Enums
![Enums](./slides/enum_associated_type.png)

#### Optionals
![Optionals](./slides/optionals.png)


## Lecture 5

### ViewBuilder Shape ViewModifier

Access Control.  More about drawing, including the @ViewBuilder construct for expressing a conditional list of Views, the Shape protocol for custom drawing and ViewModifier, a mechanism for making incremental modifications to Views.

+ [Watch Video](https://www.youtube.com/watch?v=oDKDGCRdSHc)
+ [Slides](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/lecture_5.pdf)

## Lecture 6

### Animation

@State (temporary state in a View) and property observers.  Deep dive into animation, including implicit vs. explicit animations, transitions, Shape animations, animating ViewModifiers and more.  Animate flipping of cards, new game and “pie” bonus countdown.

+ [Watch Video](https://www.youtube.com/watch?v=3krC2c56ceQ)
+ [Slides](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/lecture_6.pdf)
+ [Reading 3](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/reading_3.pdf)
+ [Assignment 3](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/assignment_3.pdf)

#### Animation
![Implicit animation](./slides/animation_implicit.png)

![Explicitr animation](./slides/animation_explicit.png)

## Lecture 7

### Multithreading EmojiArt

A brand new demo, EmojiArt, is embarked upon, starting off with a review of MVVM and then employing API such as ScrollView, UIImage and Drag & Drop.  After the concept of multithreading is covered, it is used to prevent blocking the UI while fetching a background image from the network.

+ [Watch Video](https://www.youtube.com/watch?v=tmx-OwkBWxA)
+ [Slides](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/lecture_7_0.pdf)
+ [EmojiArtExtensions.swift](https://cs193p.stanford.edu/Spring2020/EmojiArtExtensions.swift.zip)
+ [Demo Code](https://cs193p.stanford.edu/Spring2020/EmojiArtL7.zip)

## Lecture 8

### Gestures JSON

A couple of persistence topics (UserDefaults API and JSON encoding/decoding) are covered as well as the conceptual underpinnings of multi-touch gesture handling.  EmojiArt is then enhanced to persist changes and to support pinching and dragging multi-touch gestures to zoom in and out and pan on the document.

+ [Watch Video](https://www.youtube.com/watch?v=mz-rNLWJ0bk)
+ [Slides](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/lecture_8.pdf)
+ [AnimatableSystemFontModifier.swift](https://cs193p.stanford.edu/Spring2020/AnimatableSystemFontModifier.swift.zip)
+ [Demo Code](https://cs193p.stanford.edu/Spring2020/EmojiArtL8.zip)
+ [Assignment 4](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/a4_0.pdf)
+ [Assignment 5](https://cs193p.sites.stanford.edu/sites/g/files/sbiybj16636/files/media/file/assignment_5.pdf)

## Lecture 9

### Data Flow

Property wrappers (like @Published, @EnvironmentObject, @Binding) are discussed along with Publishers.  EmojiArt then uses these to autosave itself and to support choosing between multiple palettes of emoji.

+ [Watch Video](https://youtu.be/0i152oA3T3s)
+ [Slides](slides_pdf/l9_0.pdf)
+ [EmojiArtDocumentPalette.swift](https://web.stanford.edu/class/cs193p/Spring2020/EmojiArtDocumentPalette.swift.zip)
+ [Demo Code](https://web.stanford.edu/class/cs193p/Spring2020/EmojiArtL9.zip)

## Lecture 10

+ [Slides](slides_pdf/l10.pdf)

## Lecture 11

+ [Slides](slides_pdf/l11.pdf)

## Lecture 12

+ [Slides](slides_pdf/l12.pdf)

## Lecture 13

+ [Slides](slides_pdf/l13.pdf)


## Lecture 14

+ [Slides](slides_pdf/l4.pdf)