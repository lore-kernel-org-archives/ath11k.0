Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5240BCD98FE
	for <ath11k@archiver.kernel.org>; Thu,  5 Sep 2024 18:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtLGB7A2P30eTe38aKz83I8MagUAeBQdY4kLOW9iG00=; b=wMMjUsw7RZldn7ZmGchX9aqcS/
	7tE0NIeFkAI3bE8vizwl6RuEKBQVqWgQ2KR0Sby5ksJzj69wzrbjs/hGfa0+N//M0Bfrkfg2uGtIS
	lhILtvxCAGIhsSAHhpUkdEXV7s/Z1Wic1EUalZf2XDa4STcoen5qm5IHCrB0V4mPfgtC0M6l/3e5F
	wQhvaY8W54+y4hJQ3RBzqdxmAESDLs1QVWU0ZMiGjVjWOvByd5PI1GMKYMntdcS4mikbVJJlY5LMs
	0LZCaTPLj76TYOpiFN9wcS22HCuEvlB56Dg9dxcQtLlBIaQRN9vffyA34avZH18JC5+MNCSdyqlt0
	jfxZ2OTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smH5E-00000009PtV-3Y92;
	Thu, 05 Sep 2024 18:19:52 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smH5B-00000009Psy-2yg1
	for ath11k@lists.infradead.org;
	Thu, 05 Sep 2024 18:19:51 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2f3f90295a9so14708311fa.0
        for <ath11k@lists.infradead.org>; Thu, 05 Sep 2024 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725560387; x=1726165187; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtLGB7A2P30eTe38aKz83I8MagUAeBQdY4kLOW9iG00=;
        b=XpE4g6KYJUayzRRbFfX+gNLrohbh/h5+otjBfCiFxAyypZD9kddZTbfhPwd5HAbTjn
         Dt0jb4gL6rv2vkUGgiYvw142v9K0NIIJo0LgqnbViswJ7pdsf19Srtgso2ZAoDwzefNR
         JrSR7OGv4QGpdNnWfZjADUwc3n/qKF/cCQ5YtWJ5sBUc4ErSUVAU9/17LfGNTHdHUQ4H
         U3Q/J4KfPRT+pnLgDRwZ5a4o+EfhXyFqnnnK4bVjrOWmLzH6CJJWwQDlfYvpN96ANLWv
         EKAnzR52LhIys5wnZ1XJxOqhZrri+yt9zR3lYt5N0lzEfbSm+PfCfYZFbhqUasLjnNHo
         uCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725560387; x=1726165187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WtLGB7A2P30eTe38aKz83I8MagUAeBQdY4kLOW9iG00=;
        b=BbpIKy3jg+mABGCkzNC+sPDlkpDiGxrNX74NBIV1lZBe20wBKcWc6ACDJ4hQnJ+ISe
         I/ajw1DN3RjIGtGfFPlWgmtJ6K3UJ4i82no9UcjfdGVw4OnPFS8o23z8Hjr2/o8uGFw9
         /EjZ738Hikd62lUdZomwGlMzSmw8KipX/d/dGmR7mzIykzGIOW7kRCe79FPX+ityPmOH
         YhSljI9jAw6IudJXVeeYbcssrNC0/o74ar3Z8Yf2waCpr0PktvDaoHIe9hfariakP+6w
         ZSC0m7TtgrJ8y374fFlwy1ntRj/zXRUh6lvjOxUY1azvTlQT5pavqOHigTZBIAaLROeQ
         KBIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2JnuE4o5gVeU+M2GTvg1Q89FZgAztCDmE3BE5i52Vbhupsjp8VKSxukdyeGlN05sXsqsEo4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVG67/dt29ojvR+WBH49WJU7JoYgsSt9AVdjVsPOmPXtkpETjc
	ZxCK0a6XePN9oxdU06rSkdFU3PcVhTyRJNFIEBD7S/CjUEfNSCbTjVBYQDPUXBlivMT+H8dItl9
	Dy4vqnOrKTs3Vf2gJr5fNtKj5P0D0Iy3vkF5nXg==
X-Google-Smtp-Source: AGHT+IGO7FS+EJM8t1Z0R7LnnK3tpz34UapBrYrk0FGwJ34Y7Hp9Wg/QTQV1SbaJDUTpykBxZNv37DoXB5odh9EO2F4=
X-Received: by 2002:a05:6512:104f:b0:536:54d6:e6d6 with SMTP id
 2adb3069b0e04-53654d6e81bmr1544176e87.17.1725560386293; Thu, 05 Sep 2024
 11:19:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <87a5hcyite.fsf@kernel.org>
 <CAMRc=Mcr7E0dxG09_gYPxg57gYAS4j2+-3x9GCS3wOcM46O=NQ@mail.gmail.com> <87y146ayrm.fsf@kernel.org>
In-Reply-To: <87y146ayrm.fsf@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 5 Sep 2024 20:19:34 +0200
Message-ID: <CAMRc=Mfes+=59WP8dcMsiUApqjsFrY9iVFEdKU6FbTKAFP1k_A@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_111949_964815_9F721BC8 
X-CRM114-Status: GOOD (  13.22  )
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

On Thu, Sep 5, 2024 at 5:47=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote:
>
> Bartosz Golaszewski <brgl@bgdev.pl> writes:
>
> >> > +  - if:
> >> > +      properties:
> >> > +        compatible:
> >> > +          contains:
> >> > +            const: pci17cb,1103
> >> > +    then:
> >> > +      required:
> >> > +        - vddrfacmn-supply
> >> > +        - vddaon-supply
> >> > +        - vddwlcx-supply
> >> > +        - vddwlmx-supply
> >> > +        - vddrfa0p8-supply
> >> > +        - vddrfa1p2-supply
> >> > +        - vddrfa1p8-supply
> >> > +        - vddpcie0p9-supply
> >> > +        - vddpcie1p8-supply
> >>
> >> Like we discussed before, shouldn't these supplies be optional as not
> >> all modules need them?
> >>
> >
> > The answer is still the same: the ATH11K inside a WCN6855 does - in
> > fact - always need them. The fact that the X13s doesn't define them is
> > bad representation of HW and I'm fixing it in a subsequent DTS patch.
>
> But, like we discussed earlier, M.2 boards don't need these so I think
> this should be optional.
>

If they are truly dynamic, plug-and-play M.2 boards then they
shouldn't need any description in device-tree. If they are M.2 sockets
that use custom, vendor-specific pins (like what is the case on
sc8280xp-crd and X13s) then the HW they carry needs to be described
correctly. We've discussed that before.

Bart

