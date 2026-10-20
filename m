Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4163660A261B
	for <ath11k@archiver.kernel.org>; Tue, 20 Oct 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=it8lP9mg;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=tYZuLkIZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=; b=it8lP9mgDl7scxDpUAZMoozYlZ
	FmRMVV14cebCKwVUMBiScC/DrScrZiYGKy/4omiIsdxAF0N5SnrZHo22Pt0pwQsQ0wumVEhdFzkct
	B52kM+q/iwXdm5cAS7s9yXhL4+Y6Zl5U5PjQVqzi4viFW4bXEk4DXeHYPGOXFFtDXArTPvPQvzZTg
	oJS48gX6hGw7NXmB9gH0c03YxmRgILrsKgHSrFkPmz+eXjW3PRZyw7w2m9dA5TbluELhESP/frvjv
	QeV/WmmM0VLaDRn6F9i1dL3mqDkjfLRe3CmYmOlfJshVrm57cDN4uKAuCBxm8JPjH4qkPiOU9mHbk
	mQCuzISg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCbH-0000000A9PJ-2Igz;
	Tue, 20 Oct 2026 16:22:07 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCbF-0000000A9Os-1SyJ
	for ath11k@lists.infradead.org;
	Tue, 20 Oct 2026 16:22:06 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-8b0e21048f8so27237437b3.0
        for <ath11k@lists.infradead.org>; Tue, 20 Oct 2026 09:22:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792513323; cv=none;
        d=google.com; s=arc-20260327;
        b=dWwcm2CUWmrixdW+d7qoB3wKB2CskdIu7mkTIN1Cqu+AVU+8kMq+A8cfEGKE4KQ09s
         jgmlQlTxaKRuTkXOz5aVXnCxgotZsMTVNc1b7N0X5GA39+sYT2EIJFdTVhXvpUf0/Yv4
         oTUafJy+3B9VdDq/2zZgShlWYtx6eypVHO2hTLZYHVizXM79sD+7TsIGx2XGAmNnhwIN
         TJufSQNun/iK92uAoXH++z12IkbPPIl9IXk9OYSiabKfR+0DRIGNglJldjrnIvcOhRcb
         abtOKz2nBt9CcMk5IzCrWu7H/JfnlUfGlYNRlu7PG8uPnTjdZFVQlfrhdTybeHRsrhtd
         bBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        fh=Hniyf8C+qlHG5tvZQVIPScuWI4wgm0mSKeESANYY9gg=;
        b=fhFEXOjBxjAkTrQ1/IB3sh/dDRztmrMQdjkQG7KxAWL2SK4ZYly0Dp0af3o0qRTN9b
         7nrsnMPSwjLdpK3LDwl86NyOPb9Hk1yk3GM4nO5edofXLDimqzqF8Houdg2q/CqXvH5d
         xnItZOVQumx/rGMBm1EYZn7nqJc+vIswOFRRY6NdRdbWFYg7r8EbPqsA6Voafmd4J4Gz
         IYmXYY5Usnli1sF3i6qATL3os1Jig0JVVzAZnJrBUXdFMSPTW+6RQWjYLw8SO4vd3znS
         LQK9lzHZpQTsc2Bojrsynp4DpmCiDltr2j8cdbIm+tixGKWkaFmMDjRDaeLCkXRwDPYl
         62wA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792513323; x=1793118123; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        b=tYZuLkIZUHnMOhWsorW/auSgEwc5+V3tQHBbZ32Xo7/gb/sPybK866i48nSQnGTwK7
         CP+SpsNwbqtqMsB9GkNCLwzkD2moegMx2TkfJj7nLUpgRLOZAJBC0CVcheGCHOkHhrH1
         QGX8Z2WVHS99F+P8EgeR4LAWoLbH9edmRsCqmjY13qK9l3ypxvf2shao4Y49wWWSZZ36
         gGDOCb6HVnBPHxP4uC6WbZ0SVGWiSbOjhvKbiQxkYwbR/OnT3naig/WUgyohslQPlR05
         IU3EFkUn5MSmkZW/jiXYaEzbLammVxNLhpp1CLMDwItLczkAC3wCpo7rlfkNPg08l868
         Q40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513323; x=1793118123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DnTw02OnMjOZAuZ9GRe6dL799zVWgxYPWHjHUsZLswA=;
        b=x4Lp7rP3kbm5ai7g7m25Y/y2ylowAtPMSHhz9obB+c+FgtJFMcvP0PgEpaIi181JBp
         w7x48zrwXDVBfJRN6fMer1Jc++t7gGJ+n/mF5jXqHsWHWBNZXKUUKO+ayhlGwJO0aOlh
         D43fTbMHQw3npRgP+s1bjk1WPj99b41tD6OaIMEGwH+jK59y0fGTQ9rS7if+maH9O/V3
         enSTfqL61E5W+lvZjNjAg6+ADM0BeUP3uY6m/nLjntJXRCesdMaKU9hHmXQ1fyDNXNPT
         MWv5o3bW+hzjj+AdeI5aEG78oKdKu5SPvhKhqzOOCkGTxk1uhc8NDL1UzMqZosjGF4A5
         q/Sw==
X-Gm-Message-State: AFq9FYJB2ggavlUMxxMLtRFiJQAk+yyT0E8Cxa9w3ahcvNvQItkEPFfm
	PnKSvbLMSd34J/v7vRuguREXsohz2s5cXqqPZIdbso/9ZWJ7naD8PTGJdutXHq00y4OnQJvoGoq
	eRWYSuCg1ipC8b340gGvx1OFXfxkCSA4exx2pRXpXDcbH67SA727hbAvFih0=
X-Gm-Gg: AYBFou0KIwDXKjDCK3/BQkyu2XptErsuAPpXNozDxOyxZdl0wPNR1yZuNSkphKcCWnN
	B1XmpuKLL2DXHPESQ6jxZAZBo1HiCbCpg8acgQErVk5Hvphd9c0+iNJHUAw2/7311mhMZ3eThpn
	jBj54kzd2IE6ck9XcRyhLgbVR5Sng+wOZ8cS0Q2odUk1mmI/6Lp7QuCT6ERAt6l8vSf0PjJTxF5
	rdzmx0gMiYRSRsPSeTUamwtcWjf7bOKRAWW0C00lYKctw90PVfKI1GY3qyj1gYveymkcWoyC6J7
	aIf8HLQ/RVY14cdqaHL5+X+azwPmavhkYJerkaQASkHkfeuOZuqDA263wgW0UfR/bmZEVJqrhyY
	/zUp43wlZ6yG9NaWu+p3HadZ6ugBF1nuKuygGBopdCliFHDNEBAkkf6mdWJgt3RSzyKpXfbXePi
	AHgSxKGypfcNuj2zGQVhZ4rXGe1g9K1MFK8BjOPhCn03kmDIeeZk/35oArvaLMhnQlsr5BUCiFu
	ZDXAURJnHxv6DcobgNgYnX4bS3ykZ/84+Gksd8NfNf5f7lyFXsndu14nA==
X-Received: by 2002:a05:690c:298:b0:8b0:cfe6:29c5 with SMTP id
 00721157ae682-8b0f2189609mr42132047b3.37.1792513323232; Tue, 20 Oct 2026
 09:22:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018131930.1116724-1-julius@bairaktaris.de> <20261020160831.2133912-1-jtornosm@redhat.com>
In-Reply-To: <20261020160831.2133912-1-jtornosm@redhat.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Tue, 20 Oct 2026 16:21:27 +0000
X-Gm-Features: AclHuK-kc3kyc5GKqkjHU7MJ9W5xa_vMhwo9wWG2suT1Jp0haBr3CNyjEmQ0QHc
Message-ID: <CAC1t37JurQdWm7+kvBRuAafTY88DudtmG_Y=oLp1zk6FKxSkBQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] ath11k/ath12k: implement TX flow control
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
	baochen.qiang@oss.qualcomm.com, hujy652@gmail.com, 
	jeff.johnson@oss.qualcomm.com, jjohnson@kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	tamizh.raja@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_092205_407921_2F012A26 
X-CRM114-Status: UNSURE (   3.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sounds good. Looking forward to it.

Julius

