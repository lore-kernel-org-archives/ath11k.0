Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AECDC02183
	for <ath11k@archiver.kernel.org>; Fri, 17 Jan 2025 19:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cxvKQU5tEuWef2ZR6szSgBQXshTqPB/bp6pTKZegRY=; b=Hlj2K2bgWAm9DxMX/wu/W/7W5P
	2W2Cq5T4gik9CKHAM5sB02u8/H6uAsyHkAxgzS/cFH+A44z3KFdco1nKUni9J0hUtNuDB1qawgnTT
	ryQI50HxrezO6yfrHB7IKppPmUfqq0dJCbko0VY/yuoC3xNn0puf95pYZumGbXycnZQXl1m0y+4m1
	/lZhFbat2lyywYpKp5AEXQiGx/4g4F3pVWmOF3PslhV6sf8uJXZU1vnkRtJPgZxtlxyrzKwo6qAL3
	xYun8xVwxKqSIWRkZCT9co0xIUndSsZ4TXHryJzuDkcZkc82NMKhGJ69+b/AR7SgGu1v30EnV0Uvj
	OXt0mbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrqU-00000001DgB-3hMr;
	Fri, 17 Jan 2025 19:17:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYrq5-00000001Df0-3lUy
	for ath11k@lists.infradead.org;
	Fri, 17 Jan 2025 19:17:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso16814685e9.3
        for <ath11k@lists.infradead.org>; Fri, 17 Jan 2025 11:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737141424; x=1737746224; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cxvKQU5tEuWef2ZR6szSgBQXshTqPB/bp6pTKZegRY=;
        b=Lxo8n7df7mWMd6Imbb+F8bmYQq5OYCDskBoE8N+JVZxY2qYKqnpqoiUAiKVw+UUhJ4
         Fw0w0aX0tO0xG/mljryW4S9ciOcPw6YNsJkR5gRJXWnki1uLSiRt/b826XSbB602zlN/
         tE7LhNJir1PZzUjFD1Z4PC6fK0MYtJHfnoBlwKseI/V2V/KHOF0/RM1ohbgktUknmhFB
         1hlcimZVZatwiWp8DUiSFtq6i5AccSr6wrhJHFFNFCdoo8Kas/hNCMP8kQy92IyERiXu
         FUQX89lCxL0VYeXvV6xz0E/dHZTI0r2haQhICgmowhL/lX3EfJfnNDUA+A2GQN+o29j8
         SCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737141424; x=1737746224;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9cxvKQU5tEuWef2ZR6szSgBQXshTqPB/bp6pTKZegRY=;
        b=pS67cqtHhUQZjXuJVfu3V8yPUG8ZkVWNDdLhvrld8gkhIdp3f0RP8No2f1jwHYjbHy
         NUfFBg/RHXcnCQKMgYDc6kyWzkZVIkJ9qy2OpjVGItrE4wh5ouHwcUXo8r8zGlnZz5EX
         ++J/o58RYQp21zaKSixtAmzgbYTjb8pSLYI0UWMgp7IZY4R0dMhVH7Z+6+2lzIDfhe+5
         d6umY6p54yCfZ5rK28qXg4rqiphXt5t8LX1iuORDz0yq9gyBGs5fUKys8d/2gnfeZHH7
         cFPzV0ge091O8Ei1u+boGr/VXnwjVvaLWgg/KBzC9OqatgOs3AgWsS6MBHkZoBlsahwT
         vl+g==
X-Gm-Message-State: AOJu0YyUR00kz8fa1bIiobFNHvwZQ6qIUQCZDyR++JlWHCi6j1nxBUvF
	gtLcaEvcCb3hQ9d4fTyOXuHqwqMTAsRorMcFNUZa2+B3/Zn+lPy8
X-Gm-Gg: ASbGncupC0+i8cfAbenf01peM06VmLv2Hv8aEsUpdGTkoAURW4aLkNbJjT/tCUEcRec
	Y+lDc9TqWaiCXPYsTNnPhClHeEmBwCugME2OdEDQK4DuMOCGmpsaqtobdpDcnllMsFQM/5zR+sB
	QtUdL03KjC9a3g4y6p5jWIvN6vniMYA65mHfl04LRPMBgsVEPFIqBP0G++N3NINEfSG30JgUQEs
	Mpjct8bDlYzmpMq9HYDPglYXEbZQYqQ4AzgXXxDL+tj2nSh/Ml3BCCpaeCTpEx8LI/DEXmCZiQ=
X-Google-Smtp-Source: AGHT+IF/3Pew53rNIqs/RtMzp/qLGa4PToXW9cQ2P+5l0NX7kQf1/hu+Lld54hUYFKG/9d7bC+IZDA==
X-Received: by 2002:a05:600c:3b29:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-438913ef951mr41355125e9.18.1737141423938;
        Fri, 17 Jan 2025 11:17:03 -0800 (PST)
Received: from localhost (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4389041fec5sm43798465e9.19.2025.01.17.11.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 11:17:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Jan 2025 20:17:01 +0100
Message-Id: <D74L8O64EGM3.2CXM7VKQA8O92@gmail.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>, "Steffen
 Moser" <lists@steffen-moser.de>
Subject: Re: Potential Broadcast Issues After GTK Key Exchange on ath11k
 with IPQ8072A (QCN5024/QCN5054)
From: "Nicolas Escande" <nico.escande@gmail.com>
To: "Kalle Valo" <kvalo@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <c6366409-9928-4dd7-bf7b-ba7fcf20eabf@steffen-moser.de>
 <Z2Q9POuV-6MIdzRf@pilgrim>
 <b18ede18-0c33-4d14-a7c5-0066cbec39c9@steffen-moser.de>
 <D6VX7M6MGZQB.3LU3FBYJK6CZH@gmail.com> <878qrkdsr7.fsf@kernel.org>
In-Reply-To: <878qrkdsr7.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_111705_937311_15453F13 
X-CRM114-Status: GOOD (  19.20  )
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

On Thu Jan 9, 2025 at 2:25 PM CET, Kalle Valo wrote:
> "Nicolas Escande" <nico.escande@gmail.com> writes:
>
> > On Sat Dec 28, 2024 at 11:13 AM CET, Steffen Moser wrote:
> >> Dear Remi,
> >>
> >> thank you very much for the pointer to the patch. Sebastian integrated=
=20
> >> it into DD-WRT. Now the DynaLink DL-WRX36 runs absolutely smoothly, th=
e=20
> >> WLAN links are stable, the packet loss is gone. No weird states anymor=
e,=20
> >> independent from the group key exchange interval:
> >>
> >> https://data.saps.uni-ulm.de/index.php/s/NLNpWqjc8iGsaEM
> >>
> >> So your idea was a direct hit! Thank you very, very much. Several mont=
hs=20
> >> of debugging have come to an end...
> >
> > So this is at least the second time this commit breaks a setup.
> > =20
> > @ath11k why isn't this pushed to mainline ?
> > This seems to be a clear regression, so even if there is no need to rus=
h things
> > in the long run this still needs to to reverted mainline right ?
>
> Good question, I don't have an answer to that. Could someone (also
> outside of Qualcomm) send a proper patch ASAP so that we can solve this?
> And it's good ot include the link to this discussion and describe the
> symptoms the revert is fixing.
>
> This is the patch in question:
>
> https://git.codelinaro.org/clo/qsdk/oss/system/feeds/wlan-open/-/blob/win=
.wlan_host_opensource.3.0.r24/patches/ath11k/350-ath11k-Revert-clear-the-ke=
ys-properly-when-DISABLE_K.patch

Not sure if I did it the right way but it at least is here :
https://lore.kernel.org/linux-wireless/20250117191455.3395145-1-nico.escand=
e@gmail.com/

