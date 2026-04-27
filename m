Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5291CFF8868
	for <ath11k@archiver.kernel.org>; Mon, 27 Apr 2026 16:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oOP33eGJOro0PqG/QFYczjU3W2czghgRn/lu9Wlik4s=; b=iOFcqxjBcn3JvwHqYORP+QhdKq
	XSjgUhUjOJQcR9IRocGW21rTamBqdPqXNBV/LFOspbkbts1XRTWy7nJR9C5b8yRqLnhDjs6KFfZWy
	h/iJKRWBKJdZordoyB/vbMELhlZq4xX/GcGHm5C4D53GFNijfAHBOxedmXmPxvr1KcXCo8vALaLUr
	ocuNkWBKE7AM+VkKhcJtiubinJzGwW1m3ade+MhUuOF7rIzvPYOBJKpkpsZIunieLo1jnU2UN0yJr
	8QqMiG+ntTK18LCyN84jSkO2Cs5uOsct4IComj3/PJJSjdx9fHLA1sDU2W3GTeihNmBZ9kOw7VUgK
	gmZlpZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOZu-0000000HIit-11iQ;
	Mon, 27 Apr 2026 16:12:58 +0000
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOZr-0000000HIhi-3BNe
	for ath11k@lists.infradead.org;
	Mon, 27 Apr 2026 16:12:56 +0000
Received: by mail-yx1-xb131.google.com with SMTP id 956f58d0204a3-65005a8840dso8813988d50.0
        for <ath11k@lists.infradead.org>; Mon, 27 Apr 2026 09:12:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777306374; cv=none;
        d=google.com; s=arc-20240605;
        b=EjM/a1kzyWhv9g4pL+CR/UvORuiCfoTLqRkYRgBJE6T3vGBmBZqGPHJ9XW8KyZi0q3
         z7oscTI/IyIxNUbRv5rxFJedCoWFbXfVALMPfAUwFzsjjX9ZePP5GMH3iY5PrHpeKcMr
         Xr7dSeuyx99/z4d3XKZyidQNIEOB+ON89rO6wtJYSHJp0Rvxkm7vdQ5A6bVghhQHQAIO
         O2sZQfEJysTR2Jnq6k5vlKax2qhlm0S4PtcBFT+b3T5vu3WV2V1rHA+LiZsIYLzTMTYa
         c3lUYmLy+efSCw6jZQoKFK39/9DcdCCNMEzVvUarE9Ngb7INYAJaKYcO9N+V4YReG2N0
         vSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oOP33eGJOro0PqG/QFYczjU3W2czghgRn/lu9Wlik4s=;
        fh=e7cO/Kps5b+5KtoB5bGHz1sK14rkUgN8Tf9YoDCrNJg=;
        b=RKS/IpvzyNCkPgBheVTdUh/4/zh1Rc9VuVBp0a+j03HOQh32pHMrH2qNX0bSjJnFUG
         tPSMC0oQlxwsJYrf6Fck/y3LoVyFKajJzYOQirm8mv4dO6DlMsmuf6TepgL35GBY6zb3
         3Hzfyaw9FU0836jtXFPNrgZvy8EB2B5zA+sZ62sf46Dejbmai5Hh1/8xFK2EEm6h7oRD
         BfJxed2fo3R1eZivxwPk8We2BGx4FG1iV/Xwi39HxijNqTBGcHmZWvmJpFvspwG8Dr9Z
         3symRBEJLUx+UiqRzomJ8//CDl3J8xZEPpn0lRgzSuLPaQo0eryJgb420h7SLXP/QyBn
         +o3Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777306374; x=1777911174; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOP33eGJOro0PqG/QFYczjU3W2czghgRn/lu9Wlik4s=;
        b=YdKyQ5wobQoKbha4I7NkPUpB+x7vfvKhMknE0nIDUSKFAyFXxh+dJxr4+X25CAVpko
         nYG2XLiyrCYKiZ7XAOcsE2Xpo5qXcgXQBVjeEpXdnGw5ORQ3txcc/mNNZdc7/c05S/GX
         FWurVzdb5gfHfyEb27GA2mdLTPfTGefdwPyelPI+4z7EnCjVMOqtTThxeN1TCa6Tav7J
         Zu6uHQEODaTF87o1nNn6LD8PtfGX5t/9bw5InFPYVCxg5datndP8dpcpUmtP7Ff4ufWI
         PdNtZLz3DWW3NqFi1YGImo2jneCkCl8HW/jtnWRdQXb/tASoT2r1uSstpQyYBtsLX982
         umgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306374; x=1777911174;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oOP33eGJOro0PqG/QFYczjU3W2czghgRn/lu9Wlik4s=;
        b=H+L6vkaF1vOqwAgeNlznU4nto6GeizRle18xZRrV4AuwhLKFIstfVG/pQsDJxYks8Q
         tHMDUw9CD6A8wC6eafU+XwDAx1ZzuJFTHlcHXK2vNUTDWFbP7du2K1EwUCQcCQ7Pao+K
         qGfXIMbZlE6oe/X9LN6+X9Nm0aXHKxgytncHDBs19Phc5Npqyjzr/QhxkFaWruHTor3a
         3Z+0coTF6/dRF+xqhVEi4mR5/1qvzfSroOKMmYXrKJaMqsZBADbbFNHyIWCjZT26OYnL
         UXngHg7lLBkKzByKMi2GDF+2lgsl8KfvCJnxwMYJEVzM/HAyhUtYZt0KxbZKH/RBtRVW
         pcBg==
X-Gm-Message-State: AOJu0Ywo6fcHafnf9gELz/g7fU8h+xvvQxfQ15f9ntJ7uxIZrjYyWaSf
	4by5b1TPZXHdNp78dfJyJp2IZbuz/YFAgxsLMeLD+wwOryNZa0akxNo7X2y5gcjnbhzWLsyjiB2
	BqfqiH+2YH8OuvTsXHHNFfH0lVejE5Od8KdAs
X-Gm-Gg: AeBDietZloGR/uUlKJXSCt1Tmt55G4JdHD6dMk29kUxAtSRVrVgU85JkCrjJhhki5Rb
	H9IrAM8bT4QwG2LNhAh3ZJkeMfRuRngfc1PXriNZjQwp86mzSK3cV0NvVruHJmtdSFCls6fuT78
	/eMmn8n7iJaiZG0Kux7hzT0PmBu6/1LN9tOM3vN68vVNCuM/4PjFwQbp9X8owUq7uXqnzzg3CM4
	STSK1MQ3pAcnFjXnzQ6apHUAzZk2s+TH8jy/fRBKR9tS/99dm+rJVfxuornDTmTA5bGmHZm7VoT
	K3TuppyHBZ5v0mna1BrCmFPG9W22OZKhEcBd/1n7IfmPzAp0
X-Received: by 2002:a53:d04a:0:20b0:650:19c7:c5c8 with SMTP id
 956f58d0204a3-65310b4f834mr31188126d50.64.1777306374226; Mon, 27 Apr 2026
 09:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <CALgbQMzF65j7n+R6MEftB-uSgmxtcH4dq7tSt4Os_jnwrZirVw@mail.gmail.com>
 <f77ebaf4-820c-4527-b2ba-8325735b2340@oss.qualcomm.com> <CALgbQMwLkbyF0rOtvPYWu=tgUffWGHUyGgn=jMbV3W7SggfyrQ@mail.gmail.com>
In-Reply-To: <CALgbQMwLkbyF0rOtvPYWu=tgUffWGHUyGgn=jMbV3W7SggfyrQ@mail.gmail.com>
From: Adam Hill <sidepipeuk@gmail.com>
Date: Mon, 27 Apr 2026 17:12:42 +0100
X-Gm-Features: AVHnY4L6xAWSDZ7KbdTYwfgdpePmagRNb9CySzILRH0tR3jfq7XrrDxp2gJ6Pos
Message-ID: <CALgbQMwJ1V36SX4H2a7TQYn+_VbU4jO6qZr17bCDp6aj3tWDmQ@mail.gmail.com>
Subject: Re: Multiple radios/single phy - should the wiphy struct radios[] be set?
To: ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_091255_805697_08701C18 
X-CRM114-Status: GOOD (  29.01  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Thanks for the reply, Jeff. As it happens, I AM building a mobile
access point, but that's not really relevant. My assertion was simply
that since the WCN6856 et al do indeed have two radios ( they must, to
allow them to transmit on two frequencies simultaneously? ) but
presented on a single phy, then maybe they should populate the radios
array accordingly. However, if you're saying that the ONLY reason for
that array is WiFi 7 multilink then that's fine, I'll continue to use
the fact that num_channels is 2 on one of the presented combinations
to detect the additional radio - I now have my build supporting the
two radios of the WCN6856 and happily running an AP on two bands
simultaneously - it just seemed sensible to me that if there were two
radios then they should be presented in some sensible/consistent way
across devices and the radios array was it - but if you disagree then
that's fine... you know an order of magnitude more about this stuff
than I do!

As for the QCN9074, my requirement was for a DBDC capable AP card in
M2 E Key 2230 format - I'm not sure that chip suits the requirement?


On Mon, 27 Apr 2026 at 17:11, Adam Hill <sidepipeuk@gmail.com> wrote:
>
> Thanks for the reply, Jeff. As it happens, I AM building a mobile access =
point, but that's not really relevant. My assertion was simply that since t=
he WCN6856 et al do indeed have two radios ( they must, to allow them to tr=
ansmit on two frequencies simultaneously? ) but presented on a single phy, =
then maybe they should populate the radios array accordingly. However, if y=
ou're saying that the ONLY reason for that array is WiFi 7 multilink then t=
hat's fine, I'll continue to use the fact that num_channels is 2 on one of =
the presented combinations to detect the additional radio - I now have my b=
uild supporting the two radios of the WCN6856 and happily running an AP on =
two bands simultaneously - it just seemed sensible to me that if there were=
 two radios then they should be presented in some sensible/consistent way a=
cross devices and the radios array was it - but if you disagree then that's=
 fine... you know an order of magnitude more about this stuff than I do!
>
> As for the QCN9074, my requirement was for a DBDC capable AP card in M2 E=
 Key 2230 format - I'm not sure that chip suits the requirement?
>
>
> On Mon, 27 Apr 2026 at 15:53, Jeff Johnson <jeff.johnson@oss.qualcomm.com=
> wrote:
>>
>> On 4/21/2026 6:35 AM, Adam Hill wrote:
>> > I've been trying to get a WCN6856 card working as an AP on OpenWrt (
>> > but using a custom kernel and build ) and was hitting a brick wall
>> > getting DBDC to work. I was starting from almost zero knowledge of
>> > Linux WiFi in general which made it harder ( and means I might be
>> > barking up the wrong tree ) - however, it seems that OpenWrt ( at
>> > least ) relies on netlink returning a radio array to detect devices
>> > that have multiple radios on a single phy, which doesn't seem
>> > unreasonable to me.
>> >
>> > I've hacked my OpenWrt build to assume that num_channels =3D 2 on a
>> > second interface combination is the same thing ( which is what ath11k
>> > seems to do when support_dual_stations is true) and confirmed that the
>> > DBDC setup works with this mod. Shouldn't the ath11k driver be changed
>> > to populate the radio list the same way ath12k does? What I've done
>> > with OpenWrt is a bit of a hack, and who knows what else relies on
>> > radios being defined!
>>
>> The radio array exists to support Wi-Fi 7 Multi-link operation, and sinc=
e
>> ath11k doesn't support Wi-Fi 7, it should not populate the radio array.
>>
>> Also note the WCN series of devices are tailored for mobile station usag=
e, and
>> the firmware and driver are designed to model the hardware as a single
>> multi-band radio that is capable of concurrent operation on multiple cha=
nnels.
>>
>> If you want to work with OpenWrt then I suggest working with a chipset a=
lready
>> supported by it such as QCN9074.
>>
>> I'll let Baochen add any additional observations.
>>
>> /jeff

