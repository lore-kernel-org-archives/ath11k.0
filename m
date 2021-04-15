Return-Path: <SRS0=AwSP=JM=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B39C433ED
	for <ath11k@archiver.kernel.org>; Thu, 15 Apr 2021 18:01:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0419D6103D
	for <ath11k@archiver.kernel.org>; Thu, 15 Apr 2021 18:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0419D6103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2y0gZOFqIGKTkbEaWC+fBjnjeFjPtM+PicJwme9ys1A=; b=Q31e94X7iyca3D1Rh0/IDd1D9
	K6ZIm3yhGfDygHB5oh6UiVJHVZEtp7rvSbg68dcCCsvaXE94bUu4F1c/NGf49HEXj7g4hN2lzAy/K
	e02zIJuRhbR7NcCCmywAQBliuQhS4n0uWXp0p6hmczdQU9KwwfVxB1SeDgMzGeAUZkIrMGCBGBOfp
	YuwknU4GY69sn3ddoSBKrcujvj2RgskOJqgq62rnFaF2xpgm3OIcExomd/u5LBhG/mYLKsefgOE4r
	SzsYiiYHtZCiNQ7oWtTVWPng/m48lT8TPhyiIkv+i1Cdt1rBWwOQzTCfWf+WqSJeVdu/hrdUTJXlN
	UeAHv1FZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX6JJ-00GwCn-4t; Thu, 15 Apr 2021 18:01:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX6JH-00GwCV-0Y
 for ath11k@desiato.infradead.org; Thu, 15 Apr 2021 18:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MihW6DKHQxd4sL5KmBX5GV/2Df0tIhtjCcGxFvEZevg=; b=JKKlsqeTgkfS7D3SYc/i0/rnTP
 0lshTq3Vi2yA85qFbyDtvP6JXR8G0agS8B/891eNtw4teKUVh8GWqIthXFcI5p6qGkbTijAO1vsZL
 atHU8oHk6GO0WCY9NKCTLn5uNOQDbka+MOvN0f3J2mTBelwpsuczefH1qfiiPfjx2gUMqoysaLhSa
 6qFhWEIAXTw2XEH7IyZmfOPXX7LQfS3BP9aQ0PybYM3cVkJJIBgSd27bHyvt+FolFIdKbSdgAFUIJ
 iDbVFjdQNThRtpw+gWio+a5sf0yPIOJnnhvWyFz9UizaVa9WW/9cbY3ANWsgVzKO0LIOflHewOZxj
 RFrhDNJA==;
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX6JE-008nRk-Bv
 for ath11k@lists.infradead.org; Thu, 15 Apr 2021 18:01:45 +0000
Received: by mail-io1-xd2a.google.com with SMTP id s16so19843228iog.9
 for <ath11k@lists.infradead.org>; Thu, 15 Apr 2021 11:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MihW6DKHQxd4sL5KmBX5GV/2Df0tIhtjCcGxFvEZevg=;
 b=p5RwCJuNLK+qRMIaHRQnsNBvG43diAaQ0KHwp6nEr3En7pTgkpKz4cKfdJFKXep3dn
 ZG0lzuUp6BtrSwbqsaduG8H1T7YD1nC76vn5a2Yd5XatZdZm57J5xi0BDurdTAeQXXLz
 xlzFU8Cv82l1kGAu6TLJlsPNE3t0Y6n0YnTiX+49ZND9jV6v+k2tNffqCKteI0PuqtNv
 fayXgkgfXbQ50E9qWToPVoovM8Y2sTXvPVSwHyuZb0sbaMstnuVSNcdgie7Ugt1kpePi
 w++DsSsS8icNWsE1u4Ejv46d2eMAdr4Wj7vuEXvnccpH1f6KkzJo/EZcoJv74x+tZlbA
 3nNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MihW6DKHQxd4sL5KmBX5GV/2Df0tIhtjCcGxFvEZevg=;
 b=jhamwspNgO58dCkzy/miREqWFDrZ8b4PrhshBhl+MiDpu1Nnbfd+TTnyEjhJPujdxZ
 Q9+7OFZm1cVp1xMlZR/IbcHuElF78oCv3I0tqdCP+8QJMlvRvuPpyHuEmol1kPQ9yypY
 3PPxmjzrRdEXKM3Lfaj/2sCSTiVAVVRJkLTTF0wmoQDeoQo28GUWsqm8cK8qV0sRfb7/
 3/vdd8ic2bZn8YGOogeItVcqhVXBNdIToR7QGBxVKBQBIyk09PjjHg0QEP9uWs5jp5V7
 LlTDvWVaxIHTG4xCqQ+8ZuVj7AUgeAQl6ZagfGcNwAfd+9+ZVbP5UpWhiSANf0ARCefx
 5pKw==
X-Gm-Message-State: AOAM5322tn/M4nN/0suTSYEemR6ufpvD4DZGvC1OmOHivfoxqqyQB5K1
 6P9yoVJISjmXoJQW61Eyhn7xia8BvNC/dv54ALM=
X-Google-Smtp-Source: ABdhPJwTC9L8SBLOl383Q/gXCURzwhcv+v8SjWpvatiNTYe1wK2sQKkRvRu+yjTKpfJTVqKfX7LBMqfWawAHvsz0tnw=
X-Received: by 2002:a6b:b250:: with SMTP id b77mr377845iof.192.1618509702867; 
 Thu, 15 Apr 2021 11:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <SN6PR02MB5520E3ADA594F9BA98E64B22E24D9@SN6PR02MB5520.namprd02.prod.outlook.com>
 <7da530f675a485bb2ccd397b4ad303fa@codeaurora.org>
In-Reply-To: <7da530f675a485bb2ccd397b4ad303fa@codeaurora.org>
From: =?UTF-8?Q?Andr=C3=A9_Eberle?= <andre.eberle@gmail.com>
Date: Thu, 15 Apr 2021 15:01:01 -0300
Message-ID: <CA+D0iCJswb8a_=YoM1=c9vNBu15nnv_BNp2Jyh8CgnNqTs4qxg@mail.gmail.com>
Subject: Re: ath11k-qca crashing
To: Bhagavathi Perumal S <bperumal@codeaurora.org>
Cc: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_110144_426291_06D9A0BE 
X-CRM114-Status: GOOD (  22.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

I have attached the dmesg. It is the UART dump essentially, so it
includes some pre-boot info, maybe it is useful:

https://drive.google.com/file/d/1u5_C7q6yK9qRyq4TJYQpkZeU-1eQmRwR/view?usp=sharing

There is no stack trace dump during the crash, unfortunately. As you
can see the system suddenly reboots (sometimes it just freezes).

I have added the logread from openwrt also. This one has trace-level
messages from dmesg, so maybe it is more helpful. I enabled maximum
debug level for ath11 on this one, hope it helps:

echo 0xffffffff > /sys/module/ath11k/parameters/debug_mask

https://drive.google.com/file/d/1sasD99QVf2UqF7lOQ_pD5JhI43Ie3DO6/view?usp=sharing

On Thu, Apr 15, 2021 at 6:48 AM Bhagavathi Perumal S
<bperumal@codeaurora.org> wrote:
>
> On 2021-04-15 14:58, Bhagavathi Perumal S wrote:
> > Hello,
> >
> > I have been using the ath11k wireless driver (qca version ie. QSDK) in
> > a IPQ807x router, but I am facing crashes. Ethernet and WAN work fine.
> >
> >
> > I can connect to WiFi, and receive an address from DHCP. I can even
> > send/receive a number of packets via the wifi nic, but if I try to,
> > say, send/recv a larger number of packets at once (like visiting a
> > webpage), the kernel crashes. I have been digging into the NSS and
> > ath11k drivers trying to isolate the problem, but so far my debugging
> > attempts have failed. I have so far failed to set up kgdb on qsdk
> > also, so no help on that front.
> >
> > What is the best way to debug the ath11k drivers for such problems? Or
> > at least try to determine if the crashes are from the driver, or
> > elsewhere in the NSS system?
>
> Serial logs and crash dump will help to debug the kernel crashes. Please
> share dmesg logs and serial logs from power on and please share call
> stack details during crash if any.
>
> >
> > --
> >
> > ath11k mailing list
> >
> > ath11k@lists.infradead.org
> >
> > http://lists.infradead.org/mailman/listinfo/ath11k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
