Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5675CF9C6B
	for <ath11k@archiver.kernel.org>; Tue, 24 Sep 2024 17:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmWonUm1P39vQKCEWJndp/5X/hfo7HEf9pMTOa+OnQg=; b=ARMcn1A8reUolTfx4wN+HBL9/k
	g6Njb4jnWxkq3sc8ANEJiv4ocEJel0c53ArLe08Y0T29UEnrFJUPEIWo7g1wgWEagktlgayOsvRz1
	f352TycLGmzCoj6FAuzWzWlOCy7Cy6RG/bdln1YlLWMpZ7KOuigU2vHkxE+Rqs3XOZSTCHxSpmjay
	2rf0shpqljnDpRp0Wcr//Zh2FbNf7I2ZLf1DzufzbpIyVMB9UY1W/wrX/anxj8q6cFqXpoNdgxFlc
	VnA6dTNBVO8TNzIjfMp1dYVFtz1Mbu5zS+T1fLEvILaokHf7sqdFSl0rLUuktFWXVBUQbYRrUk9nV
	TuU4ZsFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st910-00000002v9E-2MO7;
	Tue, 24 Sep 2024 17:07:54 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st90x-00000002v8k-06JM
	for ath11k@lists.infradead.org;
	Tue, 24 Sep 2024 17:07:52 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5365b6bd901so6860735e87.2
        for <ath11k@lists.infradead.org>; Tue, 24 Sep 2024 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727197668; x=1727802468; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmWonUm1P39vQKCEWJndp/5X/hfo7HEf9pMTOa+OnQg=;
        b=o7heX7GGe3/64JIIYcRfu8rdXbJMPeucGBzd9iXn242pI/Gcs3qMT4ouBoKXgEr5bT
         c6ExHJo8k6FIl5NB2Si4qkcHnegg2gYMb5EyI70RhAtfUbYC6WROIJwDy5USnTx1fObf
         AjfhOPjOMWyDTuCGL3fStMby+TzOa+H7JqGpcnVNFYI+qc0I1izj6ZoLzu1kt51w8zU+
         VNTgZhDcqysfU2Rgm2zWYwaLyLl5kBfy1kK+GHZV62tJuqqRp6So9pGz9MpS/yg0R6Zn
         1hvRRMXDZfO+y939oXk0CKbkzk9ZgHMEKz/JwUstsTESlNsJwFqVYWwSYZXc6Y4hdeoI
         2JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727197668; x=1727802468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmWonUm1P39vQKCEWJndp/5X/hfo7HEf9pMTOa+OnQg=;
        b=dOAp6PsImeWMBtb7O99qyVXHpty3lvMSSdsoWo5zVYxRjpGBxTYeKMH1I/EizlnoFH
         fca8o3HnzgscwQW1NaYylaUwlVc3VWHnPKWjrTwnkN7n9UbTddLjkwuzV03gGg8ZKfnm
         XCyWoAtC7on5zNF19p/+r6zRD7CiDiOB0kcTdO0GHNK7iK2LHfnlVMMEnuaOGXlQVV9d
         XEjnA5qfkerQlVLcjEXBSn1g1ClD/Wrs1JL4Mcl0Ldu44OBzG+QDF359wBFAXHjHIPLI
         dCuV/4Jf/WHzbs0n0NSKLrN7eK5mq9u5FSQXAhW2cO3x0voKPjJTvYmKjSdPzye1Jfmp
         WMvg==
X-Forwarded-Encrypted: i=1; AJvYcCXt0i9wAAbL2F/BWWCbYDCMoxOudLYkuuMT+vKxhrMXAMTs1GS41tb86y9lY5OXf7fXpq6otk4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwU5imVwdgp/ox39pBk8pqRUspxCZTylOONigW5KkTaYecFSm6L
	A21Nc0fAWjtNft67/etQu4PjDbwt6e7NNTVN4P68omXg3OF8nmxPVrRvqBXwunp6/QfW4Q8hO/r
	QQQCT/7zsQ250+gBffjLFFMMG8CZjj7htUvMiTg==
X-Google-Smtp-Source: AGHT+IFQnrBRXhzqzSbxxq2DuX3Rr7dDGfruh+nq0Bk+q33oxwalD2WnXbMn4dLD7JssdiRP1qllG9ZevtZnEADLc0c=
X-Received: by 2002:a05:6512:2348:b0:51a:f689:b4df with SMTP id
 2adb3069b0e04-536ad3b7cd8mr8126306e87.44.1727197668160; Tue, 24 Sep 2024
 10:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240814082301.8091-1-brgl@bgdev.pl> <83c562e9-2add-4086-86e7-6e956d2ee70f@kernel.org>
 <87msk49j8m.fsf@kernel.org> <ed6aceb6-4954-43ad-b631-6c6fda209411@kernel.org>
 <87a5g2bz6j.fsf@kernel.org> <CAMRc=MeLick_+Czy5MhkX=SxVvR4WCmUZ8CQ5hQBVTe2fscCPg@mail.gmail.com>
 <b7fdafd6-5029-4b80-b264-11943740b354@quicinc.com> <1e79d94e-2f83-4762-b126-ed865142f1ed@kernel.org>
 <312fa408-d385-4b90-b8f4-729af4a3ce65@quicinc.com>
In-Reply-To: <312fa408-d385-4b90-b8f4-729af4a3ce65@quicinc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Sep 2024 19:07:35 +0200
Message-ID: <CAMRc=Mc4AZR3aztmODtpgLt3P63=WGGfupjNSSJdFseH=pAhtg@mail.gmail.com>
Subject: Re: [PATCH net-next v2] dt-bindings: net: ath11k: document the inputs
 of the ath11k on WCN6855
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
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
X-CRM114-CacheID: sfid-20240924_100751_360463_88268408 
X-CRM114-Status: GOOD (  21.92  )
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

On Tue, Sep 24, 2024 at 6:46=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On 9/24/2024 1:06 AM, Krzysztof Kozlowski wrote:
> > On 20/09/2024 23:02, Jeff Johnson wrote:
> >> Again, since I'm a DT n00b:
> >> Just to make sure I understand, you are saying that with this change a=
ny
> >> existing .dts/.dtb files will still work with an updated driver, so th=
e new
> >> properties are not required to be populated on existing devices.
> >
> > Did you folks rejected patches acked by DT maintainers on basis of not
> > understanding DT at all?
>
> I personally have not rejected any DT patches. Nor have I accepted any.
> I'm deferring to Kalle.
>
> >> However a new driver with support for these properties will utilize th=
em when
> >> they are present, and the current ath11k .dts files will need to be up=
dated to
> >
> > It is not related to drivers at all. Nothing in this thread is related
> > to drivers.
> >
> > Can we entirely drop the drivers from the discussion?
>
> I brought up drivers since in the discussion there was concern that this =
DT
> change would potentially break existing devices that have a DTS that defi=
nes
> qcom,ath11k-calibration-variant, and I wanted clarification on that point=
.
>
> /jeff

How could this happen? DT schema is used to validate device-tree
sources but is not used by the kernel code in any way. I've said it
several times over the course of this and the previous (qca6390)
discussion.

Bartosz

