Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31661C3DA79
	for <ath11k@archiver.kernel.org>; Mon, 15 Jan 2024 13:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqciNHiwX5Xpe9HUhoDTBRkSyWdUM5unYCkQrW8mDZo=; b=t0lxIeEToIum7eWi+6rmUL/mc0
	N8Boe/VgoOiPjdAh7GiYTuYbOGdKoFg2ccQUiom6bdjCqCilspbW87xrJQHmMQTMflnHrP9oug3Kn
	oyh/I5uZTt13JAH5dJv39zc3tp4VODl8rdnCwF+6wAZo+JUTIPfJNWVgOqfgK4qEojMJAA/wS+zsx
	cf3Vcfx4YwrteSqCi8ICYYRGhhuYG5DRsqldr/hqUMoLmEq2UURJdn8aF7omKMjAmplGMb5h5Eb8t
	0fl2p2K+TupuXpH9BRYAdt30cULblMhdC98+jSDzh3FpzcRhJPPrEfBgCoEPY/FTHnOQc7J1Hcs11
	LkrBB++w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMie-0090Dr-1P;
	Mon, 15 Jan 2024 13:09:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPMib-0090Bv-1q
	for ath11k@lists.infradead.org;
	Mon, 15 Jan 2024 13:09:35 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3368ac0f74dso6369051f8f.0
        for <ath11k@lists.infradead.org>; Mon, 15 Jan 2024 05:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705324169; x=1705928969; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqciNHiwX5Xpe9HUhoDTBRkSyWdUM5unYCkQrW8mDZo=;
        b=A84AF6NpCunKYSzgrKEm5PXf7+t/PSRXYjT9jSdsipzMNgVOOgMS5PdPgTiTyvl6Lz
         rFAcfq6IwbLSoocpqIh6flNPuEIq7Rp4AWL8VdHH7tlByFzhxe0aeZ4812BlC0mBum8j
         SWTINFARwC5K87xtYQhUuL7ykekaxjMtlOLIG6L8gD4KeSguiiizisDm+wp1+9cwcQl7
         Jz478V4joZiN/ySPTIKWeyWPtYcFEed3pmRd7/1bHpBu+T3tGFBo7Ol/LHRNPBNnPFBM
         8z570/Bq87PPphbK3K3ZSd9UjHLvNolo1mdfgWHcfoCbyR0r6AcVKMUp8iuk/NFQ43d6
         h/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705324169; x=1705928969;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xqciNHiwX5Xpe9HUhoDTBRkSyWdUM5unYCkQrW8mDZo=;
        b=gq8jlGXWkX9gvaZNRCZ2cCxMbCxQnTRRwIYRvuEAilnwU020zJ8WEaQ3tXZVVfPtZA
         +ASiC+JqSlHWL+nZ3CwhOwMESa9LSPVJyZsFfGJ92i9HFulv4S0iADy7+yX74ywsvyBB
         3BShgfgcmXEb1c2s4M//e9AlaKJ3RQY1jRhkgJ+V57IJa2HUscHpf+W3pC3TJMC/69SV
         MIG3vHVA4Ci7KJQ9976hCe4xOuJxiuANtXucqtIIMm/clae59QpTKX4ITjsEL8xHdViW
         3zkhQmhAEJ/ZMvhngWv+4VZCgIeJ8sPMMhi4vCN1QV+nnxCAnVtJSRidAtbDAKW7y10w
         mvjA==
X-Gm-Message-State: AOJu0YxO+d/VNd/xWNNEOkzNvGwG83s/AYTJUicG4ZhIQUsKheBxe5wV
	8e2bm/tfl/piZmWYZc3fPf6f+ISyal0=
X-Google-Smtp-Source: AGHT+IE3Hcks9ZuOLGbttyuv2aHArfvLfRvJchXNZtRx7ewfjtOLGEBT8LxfluFLjDM8Gk5c+eFnvQ==
X-Received: by 2002:a5d:420a:0:b0:337:9015:ab4b with SMTP id n10-20020a5d420a000000b003379015ab4bmr3610104wrq.108.1705324169004;
        Mon, 15 Jan 2024 05:09:29 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id d16-20020adf9c90000000b003366c058509sm11850615wre.23.2024.01.15.05.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 05:09:28 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jan 2024 14:09:28 +0100
Message-Id: <CYFAYRP5MWTZ.Q272WWLLE7MW@gmail.com>
Cc: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <ath11k@lists.infradead.org>
Subject: Re: [PATCH] wifi: ath11k: fix layout of scan_flags in struct
 scan_req_params
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>, "Kalle Valo"
 <kvalo@kernel.org>
X-Mailer: aerc 0.15.2
References: <20231127180559.1696041-1-nico.escande@gmail.com>
 <bdcdbd06-e9bd-4a92-b27b-d94b2d8fb52d@quicinc.com>
 <CX9YPUDTAT1N.23DMRB5O9FEAO@gmail.com>
 <20c7a367-2243-4e13-b023-9999dc6c6790@quicinc.com>
 <CXC03GYAN4VN.2PQ88Q1S7IL6H@gmail.com>
In-Reply-To: <CXC03GYAN4VN.2PQ88Q1S7IL6H@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_050933_607943_AAC26B93 
X-CRM114-Status: GOOD (  18.14  )
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

On Thu Nov 30, 2023 at 9:24 AM CET, Nicolas Escande wrote:
> On Tue Nov 28, 2023 at 1:57 AM CET, Jeff Johnson wrote:
> > On 11/27/2023 2:54 PM, Nicolas Escande wrote:
> [...]
> > > So either we should not use WMI_SCAN_XXX with scan_req_params.scan_fl=
ags ever
> > > and only use the bitfield to set scan parameters or if we use WMI_SCA=
N_XXX with
> > > scan_req_params.scan_flags they need to match the corresponding bitfi=
eld.
> >
> > IMO the correct thing to do is to remove the unions from that struct an=
d
> > only leave behind the bitfields and not use the WMI_SCAN_XXX masks
> > except when filling the firmware structure.
> >
> > But don't spin an update to your patches until Kalle has a chance to
> > give his opinion. I'm new to maintaining these drivers and Kalle may
> > have a different opinion on this.
> >
> > /jeff
>
> No problem, I'll wait for Kalle's input on this before doing anything.
> As soon as we decide which way is the right way, I'll work on this. I onl=
y care
> that this gets resolved.

Hi Kalle/Jeff,

Any new input on this so I can move forward on fixing this ?
Otherwise I think I'll end up going on with Jeff's proposal of only using t=
he
bitfield for intra driver representation & then converting the bitfields to
their corresponding WMI_SCAN_XXX when transmiting the req to the hw with wm=
i.

