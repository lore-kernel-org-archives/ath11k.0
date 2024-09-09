Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89825ECE57B
	for <ath11k@archiver.kernel.org>; Mon,  9 Sep 2024 08:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqpEQh4sBoQwdW0zDyVFx/eKEJAMmdpxYeT1Q3+RaJo=; b=LHxPyB1pTxywkDjGVmEnjozFAd
	VRCIiUQ2rsyUNYtcmJ/T2derypt5us483ONoE1eke914aafvspexHmedjiSjYaF0o2OCkfY2tbWCB
	vOw9W4anouThWC9BzP1i1R57kIRmFrpkwNXkK3VV+PTdHA8bA1tqW+JQDpOcdeJ6dONmgD2fScDBy
	e4AEMpmYaIBvpxQKEr5Xx9xuNBFQcN8SGtCx8SBy/pEZaekq3GsLTMuTsAvO0HZ62qlva8o1PrNy3
	diuZKK3Bq0SGAoghxP+CahQZuQ7XuAkDf1041pqpErFxCsyLRDnJrSPE8R9vK65vbz747LYPwFijm
	WvRPGKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZzm-000000019bz-2jdq;
	Mon, 09 Sep 2024 08:43:38 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snZwR-000000018n7-3CDG
	for ath11k@lists.infradead.org;
	Mon, 09 Sep 2024 08:40:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2053a0bd0a6so42882965ad.3
        for <ath11k@lists.infradead.org>; Mon, 09 Sep 2024 01:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725871210; x=1726476010; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqpEQh4sBoQwdW0zDyVFx/eKEJAMmdpxYeT1Q3+RaJo=;
        b=Bj0F8Uza1+DeDJRIR2PAnoy4qHYF24AmLdLpeMi66pwoAiy8aG7MKlBuYv00nRHKZl
         PN82ckOJXgHVkGkOS0miLLmexOACBKyW4MQNHO3LICeAgkp4J7cRWn1nOePXK7U9ShXq
         0IYQvMHLd4FoyQlJJaeXazbwzUjHuB3LiUHqO2QrEaTMrEeqjk7FINsbhwv0b9RsYaYl
         8CtHUabRfz5fcWFCWXis6d8tPrwSdx59GTxgpoU4AihIfUL9AoePv8SRV4aeMkF4rtc2
         iYMmAa5Ob1mGtBNf1Jc0yfr71MCYHQlnf3dAKDAt2S6dUiJauXZmzzaU2vGcJR0dkBoG
         2Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871210; x=1726476010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqpEQh4sBoQwdW0zDyVFx/eKEJAMmdpxYeT1Q3+RaJo=;
        b=PYL0c25Abc3IbhyH4luEvHGtHHY0UmmOJ/vdVfoJ6F0n+Y1jXiWlP6rbs5AizF0WaJ
         Ug4MWwONYThntbgFkk+9dix3rhIlh1Ty2P0mfBwP1SQCYxide/USDvBfTMCB58xjyTNe
         1As02giL4yfAP6x4WWeoSJo3FbATwxZRr3tyta/m+oxHjwZKHB0DUCO42OkjCtMuOHym
         /5063L+BS8joF56wNauqz2fLqUBhNxu2AtMZRpxVrIWJPYNmTWYNWgm+1xsraz3DeTJt
         8Ju1RfGO0l0zq84V9mXWFdNrOLjW2iHyMyEArA1z/D3M/uKk52U3uSGDhqn6r2wTwZdw
         0l6A==
X-Forwarded-Encrypted: i=1; AJvYcCVLA9MVVPmsqVdWhI0NCXrX6Qsfh/r2Fg9P4s0UsHsOGPcXFr/+G96d6D6c220WzlTdi90duoI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzauXje+iFUxK7Kh78K3VrOAQbci+lamJkzfvcImXIJ91W7ZreC
	VmM/PsPglftbvx7elmsofmksTGK4YQb7eAcK0MzuRC3XbXfyousroPNcGiBnHZMGGwTR+VMurOB
	jmK5rxNfisJVmnhW4zVvkjcxH4V3Ntotz56PPMw==
X-Google-Smtp-Source: AGHT+IGSidNq3jUEQEJSqnWgN99y4SS7Jygw5mSUwYdDDZw3FUVxb/dTY1uPdbhbg6KR4qvmI4iSAuTedjHSYjmyLF8=
X-Received: by 2002:a17:902:e850:b0:205:8212:1f2f with SMTP id
 d9443c01a7336-206f04c7e54mr109327965ad.10.1725871210359; Mon, 09 Sep 2024
 01:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <87a5hcyite.fsf@kernel.org>
 <CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com>
 <87y146ayrm.fsf@kernel.org> <CAMRc=Mfes+=59WP8dcMsiUApqjsFrY9iVFEdKU6FbTKAFP1k_A@mail.gmail.com>
 <878qw6hs4s.fsf@kernel.org> <CAMRc=Mc_Qy6-Rgsw_uOweUXtoiZGMR0D22Ou9nXUJDDdPCZqLw@mail.gmail.com>
 <1e77b503-36ff-4a97-993b-f87d658c9970@quicinc.com> <CAMRc=Mc9kzC6PLZM2-kmuC-FtzdM8P9e-YRVxWjg28tAc7BRgg@mail.gmail.com>
In-Reply-To: <CAMRc=Mc9kzC6PLZM2-kmuC-FtzdM8P9e-YRVxWjg28tAc7BRgg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Sep 2024 10:39:57 +0200
Message-ID: <CAMRc=Mfk8ukZhG9B8XuMKEO9+AgbGA27F3Wjo-N-EKfOs_b1Cg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_014011_831858_E5EB1022 
X-CRM114-Status: GOOD (  32.83  )
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

On Mon, Sep 9, 2024 at 10:19=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Fri, Sep 6, 2024 at 8:38=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:
> >
> > On 9/6/2024 12:44 AM, Bartosz Golaszewski wrote:
> > > For upstream - if you're using the WCN6855, you must specify the
> > > inputs for the WLAN module so it's only fair they be described as
> > > "required". For out-of-tree DTS I couldn't care less.
> > >
> > > You are not correct saying that "M.2 boards don't need these" because
> > > as a matter of fact: the WLAN module on your M.2 card takes these
> > > inputs from the PMU inside the WCN6855 package.
> >
> > Let me start by saying that DT is one area where I'm a newbie, so I hop=
e I can
> > get some education.
> >
> > I'd like to start with an observation: I've used both WCN6855 with ath1=
1k and
> > WCN7850 with ath12k on an x86 laptop without any device tree, so from t=
hat
> > perspective none of the device tree stuff is "required" -- these module=
s "just
> > work".
> >
>
> Yes. This is what I refer to as "fully dynamic" M.2 cards, where the
> card typically has an on-board PMIC that handles the power-up of the
> device, respecting all timings etc. No custom pins are used. You don't
> need device-tree. DT bindings don't concern this case. Even it this
> was an ARM, DT-based platform, you wouldn't need the DT entry.
>
> > However I also realize that when these are installed on Qualcomm ARM pl=
atforms
> > that there are GPIO pins that control things like XO clock, WLAN enable=
 &
> > Bluetooth enable, as well as voltage regulators, and the device is
> > non-functional without those configured, so the device tree items are r=
equired
> > in that environment.
> >
> > So just from that perspective saying something is "required" is confusi=
ng when
> > there are platforms where it isn't required. And perhaps that is what i=
s
> > confusing Kalle as well?
> >
>
> The properties are required IF you have a DT representation. Because
> if you're modeling the physical package, this is what it looks like.
> The one on your "fully dynamic" M.2 card is the same - it also has the
> same internal inputs and outputs but you're not modeling the external
> package in the first place so you don't need to care about them. But
> if you do represent the chipset and not as a black box WCN6855 in its
> entirety but its WLAN, BT and PMU modules separately then it warrants
> making the true inputs of the WLAN module mandatory in the schema.
>
> Please let me know if this is enough of an explanation.
>
> Bart

One more thing to add. You guys worry about existing device-trees,
don't, they will continue to work fine. This change only mandates that
upstream DT sources model the inputs of the WLAN module and it's only
verified by make_dtbs. This doesn't make the code require them.
Whatever works for you now, will keep on working.

Bart

