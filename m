Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D31EC369D9
	for <ath11k@archiver.kernel.org>; Wed, 30 Apr 2025 14:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2OUPwf5IqiWZra1RWdEivTGb7UptE4RADk/sgo5a3g=; b=zvRuKpaGfioNo/HehxnYT/LpfI
	ZE/X7Mx9zRFALymmCpN9Vy/Whc1tXDYVIT1dkm5PeJjMmWSuAWsUH3Ihx0kp+5n3swhqH7C1SSoOA
	qjw4i2hcbBFknHwXQVAXrdbWEu1Ok2EOMR7x/hXl1d4dFzy1uN0iSbXHE66uAum07ZuqqZ7DUYr2Q
	9nbyFjcYFexS37YWPixAYNmb5S6Rtk80tL70BE6bQOXqw2USTiQFREsLu+YTCxPEhtHg4xwjwko0N
	cnd4zkmBvTZv/uEQed4zMio33gGpBXbrniXG5JnbgUYSdhOIkchLmmlDDxZ52fpg7uo4Eyi/peNc9
	Uf2OFWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA83r-0000000D4WX-2N0h;
	Wed, 30 Apr 2025 14:05:19 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA83n-0000000D4W7-3RyP
	for ath11k@lists.infradead.org;
	Wed, 30 Apr 2025 14:05:18 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-4c32190386eso708933137.1
        for <ath11k@lists.infradead.org>; Wed, 30 Apr 2025 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moment-tech.20230601.gappssmtp.com; s=20230601; t=1746021913; x=1746626713; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I2OUPwf5IqiWZra1RWdEivTGb7UptE4RADk/sgo5a3g=;
        b=HmYR/cHrS+M3oehz1O03QCqYFg1JA62C6B4wygcoa4CXQR0DF8jppHST9SB5UE8y8F
         S1KFliTaEMcWKC8UgjMH/pzBkcaYbhSEr692W7+e/1bo8652e9arHNQkvMNjxpgQpXbp
         kXBRStW8Vl4XJd9+jTGoA34ZYIHjL/G2vEU7Sm6CKZ8a+Ov/v6pvyw4CSR4uCXhiDw+t
         wMH2KXTwVDiEWeFhoTyRyhHjdUQ3haeiqoiRGrtHl9LBPOPK48N4E6GStWVbrl6ayyLU
         x1xZNTBSV8S3zyv2RDIsTPQl6Qn9wGKhG6bd4zv2C7zQOXtvK7IPAZ7U4fuoJCE2ZNZY
         BkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746021913; x=1746626713;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2OUPwf5IqiWZra1RWdEivTGb7UptE4RADk/sgo5a3g=;
        b=lLF24aCvKWRLKs5I+ThNAmZK51SyJCz5bZkx5wnGYNGdOkPWbwZ0rwgaMV3EtnLSEi
         7bUiJpUC+NCBXXOf2ZPg1IlMXRflp1ptLI/KPx+WoSL0qJ3fuSd8/sKHI3xt9huTXZgM
         p7+7QhYPJKHWLmFl6ocQd5neT15wfWBFTdmDS5zD8OfwJ3gCg4h5gWxmkDu4o++28KvP
         wQgThl5DNAUkB4whwagvlAFA3Rlz5sxZ+WuBLJD7lTwd4x0O3astm6ndfkw7yyY/vvn/
         6rT3A3bgOByj/vAELHVJEjVdg4bpLREFitXmBdLBYyEXReeJ5MqUn/BkgRmqxheeUnga
         FRog==
X-Forwarded-Encrypted: i=1; AJvYcCUHqO88dl5eGU0ScehSl8UL9xVyueyuIVAGjhugVhGNS2+B7I8CifGTH8R97JK6s9NNukymU7U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2BY7hHvKl85zgXmBoFxYoqX10pcNN/lMW6EN+uD5/pPRGX7YA
	1pUuxd5DqRbI7laczgp5rCJyf+p5NpqnWrhi0ZkZ/a1F+JKcdKN7vRZ3Rvk7YhnNazgpitSnxuh
	5RdwzloYG+ELw6m2+MRzup+yJ4F1SdWkWaDCUuw==
X-Gm-Gg: ASbGnctGsbkxl5W29vRNzUemb2Kbi+QNv0TorgKK6g5QEK2nr737ZXIezSj0B6V3XL0
	gdEUtS96EumC8d1aLfi0itvy38DB7uS3t5sGpST4SCtYRpTTH6BZSnne+zGe+utuCK6A4NVIZug
	kYEeuRIEUZ2RK3tMlGBnrbqJJ3
X-Google-Smtp-Source: AGHT+IFox9j8ElbmmlmqmMXSXqVv6H1uivmvAtosMymiUPi0Qm8eVkYrV3yL16/ZGLs9JywFJsbveyAeuMmKzDepc8Q=
X-Received: by 2002:ac5:c389:0:b0:527:b804:ff78 with SMTP id
 71dfb90a1353d-52ace3b4332mr1525482e0c.1.1746021912610; Wed, 30 Apr 2025
 07:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com> <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
 <CAONkfw6m9O_6FZHBrPYdpv+=AxSgsbh1T7+GaS+U+bnjyVVJvQ@mail.gmail.com>
 <3da5d47b-993c-405e-841f-1d16d8715610@quicinc.com> <1d0682c0-ee5d-f2d4-199d-4ebc4e71f9ef@quicinc.com>
 <3660fcfb-be29-422b-a352-3996ad3fc41f@quicinc.com> <CAONkfw5-bfYRwHZ9iHhgJP2f8Zqyz5SZVbdL4n9EPhKU+=ONPg@mail.gmail.com>
 <CAONkfw7xjJjMAZSfHg5avEV=Bc5aJZqrRxMDvKWK4g14bLNjRQ@mail.gmail.com>
 <d4b01807-0770-439a-a77b-1e0f078687e3@quicinc.com> <07013bbc-296a-2403-a6ca-70de220495c5@quicinc.com>
 <fd6c118b-90ea-4d11-13d0-d8f49f9325e3@quicinc.com>
In-Reply-To: <fd6c118b-90ea-4d11-13d0-d8f49f9325e3@quicinc.com>
From: Balsam Chihi <balsam.chihi@moment.tech>
Date: Wed, 30 Apr 2025 16:04:36 +0200
X-Gm-Features: ATxdqUFWDJWFx48KtZzaecKPXcltVvNxFNp3xxh-kcqEgh_N4UyHIqOkZlZR5x8
Message-ID: <CAONkfw7z3QZORCMxOJAnzF0bLNmsZKfV3rOYEhStAK628dpq+g@mail.gmail.com>
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, jjohnson@kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_070516_130538_4F14E3CF 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

Hello again,
sorry for the delay.
i did further debugging and the i found out that in
"drivers/net/wireless/ath/ath11k/pci.c",
"static void ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)",
the "val = ath11k_pcic_read32" calls are causing the kernel crash.
by removing them the driver is working properly.
so to answer your questions :
@Baochen Qiang:
>is this instruction causing the synchronous external abort? which src line is it pointing to?
the src line is  "val = ath11k_pcic_read32(ab, PCIE_Q6_COOKIE_ADDR);"
and any "val = ath11k_pcic_read32" in "static void
ath11k_pci_clear_dbg_registers(struct ath11k_base *ab)".
@Vasanthakumar Thiagarajan:
>i) Was this working before for you and broken recently or it has been
>    like this since you tried first?
the crash exists since began working on the project with the same hardware.
also earlier versions of openwrt has the same bug.
samething for Yocto kirkstone and scarthgap.
FYI, i use two different QCN9074 chps one from Compex and the other
from 8devices.
both chips behave the same device_id=0xFF and they both crash because
of this bug.
so had to load different board-2.bin (provided by comprex and
8devices) for each WLAN device to have 2.4GHz and 5GHz bands.
default board-2.bin (provided by linux-firmware) did not resolve the
kernel crash.
>ii) Running into same issue during rmmod of ath12k driver instead of
>     reboot?
both rmmod and reboot of the ath11k_pci driver cause the crash
>iii) Is it possible to attach the console log during reboot also?
rmmod and reboot are the same logs i already shared above

