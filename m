Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2BDCF9C68
	for <ath11k@archiver.kernel.org>; Sat, 21 Sep 2024 04:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hn4fReQotENKNmRSfo2n2nLfnja9kCI0SETHuXmadRw=; b=4i9ecvY6LDzkvODvRaU4lLibgw
	C9+DOjj8u6smtPuViZqZgkijBRXAfrCpEMNib/luzu5he3CPh+Ue3HHESMjXzV+mNTTJgZMEGSyqB
	7s5bwgBdNgpqEn5JWocluMbpfK+0ip2NCtLrmf58g/EZlFjk97D/Jr19aeVTlznZTqgVGg5PFHJ2P
	W58+k/i3SGN005eD3f7n1HjxB2uA7hG5fTyHVV1yXvPckCE3n3WDaGLjN92lDKUiXtEdpHoJZXM9E
	dLEh02r/vWkXbFImK7ukqJj4aKh7NYgjO7fZtHksYoVpp4jMmhwgBFCINj2D5cOWS0umIS8pach4P
	aFaerCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srsAS-0000000DIjC-0QcS;
	Sat, 21 Sep 2024 04:56:24 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srsAO-0000000DIid-0gGS
	for ath11k@lists.infradead.org;
	Sat, 21 Sep 2024 04:56:22 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53655b9bbcdso3196414e87.2
        for <ath11k@lists.infradead.org>; Fri, 20 Sep 2024 21:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1726894577; x=1727499377; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hn4fReQotENKNmRSfo2n2nLfnja9kCI0SETHuXmadRw=;
        b=O+gop/W7D1x2CbRiu0bZ9/JRHHkIimF2Ht9RBa36Xq+nUmWWinxwHr65XKlNLXvLJN
         F7BJs8XdLnbGIBQp1dSI7ERoV4NtXwqSidb4VAmxuL5qLkp2eXPwTBOTExbgMOP5Faba
         n4Q15IonYBN3LzWOkRqYpV2PqAUs/Qmsm8Xq0HjCbLKTBaHgPpSuXkmxsTp6Kk63sG0f
         2xcsB2D/UNirQ0yXUfdO5ZiHVqssLI+qB5cZnbtYHcBlKHgj14TAMGhzQMEi8/PYnsmB
         N5JR9tg49VcyutZLvaEPdmjPRYK+cdNKWTOreQxb6m0rdXUk/ywYBT/ExvdNlYe1IjgD
         Is0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726894577; x=1727499377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hn4fReQotENKNmRSfo2n2nLfnja9kCI0SETHuXmadRw=;
        b=mNGijnCQrgl6H5kMPm/MJJi1Fq2TDxd5DxwzhaySF5J/bytoPiBC/zkQxBYk51vWHN
         2i7YvJExE5Aba9Rsgdb0kAhLAi/PUlHrBRq/aFcWplzaDIDkn0ZgDziKYnRATL1/DHjR
         47lXOY8BNgCC2wyJ4l+1W+uyjq8UJIZUm/MbfHd1dvYlsN3+4G5EPw3bP7vBoTemJFQ0
         oX14wDPuqRYPnIS0dusF1JmZ8fzmlQGQo+eUkN7Nd7Wf5uHTvt+vBa+OyqHqL+pfW1Hm
         s0o/yFvljIMkqR6sFBbpJU2f77miOQQi5fUuD5Hl8OZ5YXSKYnEqlnAji5Vrmq0oOosl
         hDgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlup/hBRa98yoHVqnKs5WNBV/G12FTApmVhrYswN0gCSnk8pZ8YNCSBskFagM4cFlZv26dpOY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGwSmkAqOhbt2CFozG8ZmgH6frgYeDeM88AVAiZL9bt570FCBm
	QQSUc+HaZs968JkOBgKtzjxGYT3MU1/7p7x1fjmhOdCMKQeJ4F9ZTt6kEynssffwyyKxcNaFrDH
	GIU0HbFwWf5PX8Se1fcLNTNID8ewTSFRylQusOg==
X-Google-Smtp-Source: AGHT+IGA+v7LGeKCraVVm2W3WnYjYpCsEiYRqZiZBxxc6iUgx4AERJeZIH1YVuoDb+oq4aKfLjDqUP1XyHd4Vib/la0=
X-Received: by 2002:a05:6512:158e:b0:52e:fdeb:9381 with SMTP id
 2adb3069b0e04-536ad3d72c9mr2962459e87.43.1726894576446; Fri, 20 Sep 2024
 21:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
 <87msk49j8m.fsf@kernel.org> <ed6aceb6-4954-43ad-b631-6c6fda209411@kernel.org>
 <87a5g2bz6j.fsf@kernel.org> <CAMRc=MeLick_+Czy5MhkX=SxVvR4WCmUZ8CQ5hQBVTe2fscCPg@mail.gmail.com>
 <b7fdafd6-5029-4b80-b264-11943740b354@quicinc.com>
In-Reply-To: <b7fdafd6-5029-4b80-b264-11943740b354@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 21 Sep 2024 06:56:05 +0200
Message-ID: <CAMRc=Mc2sbTrORZr4K4NgdyofNTipR1-QEqNK9mmNT=sd1myHQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	ath11k@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_215620_497666_E1BE8F4F 
X-CRM114-Status: GOOD (  14.77  )
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

On Fri, Sep 20, 2024 at 11:02=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:
>
> >
> > Let me give you an analogy: we don't really need to have always-on, fix=
ed
> > regulators in DTS. The drivers don't really need them. We do it for
> > completeness of the HW description.
>
> Again, since I'm a DT n00b:
> Just to make sure I understand, you are saying that with this change any
> existing .dts/.dtb files will still work with an updated driver, so the n=
ew
> properties are not required to be populated on existing devices.
>

There are no driver updates. No functional change.

> However a new driver with support for these properties will utilize them =
when
> they are present, and the current ath11k .dts files will need to be updat=
ed to
> include these properties for pci17cb,1103, i.e. the following needs updat=
ing:
> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts

What new driver? The dts is being updated in a separate series[1]. It
makes this platform use the new power sequencing subsystem for
wcn6855. All other changes required to make it work are already
upstream. There's no change to ath11k.

Bart

[1] https://lore.kernel.org/all/20240905122023.47251-1-brgl@bgdev.pl/

