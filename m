Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42122C83F2D
	for <ath11k@archiver.kernel.org>; Sun,  3 Sep 2023 23:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToyDI359AT8Y1M4hZnamCelYa0J9SLjNvy+vKsY0CUw=; b=PGA0S6VrC6k+JB
	opHtjEkcqt+HI8l0vEAGH/O8QANHGoUDAzEUSUIiLda+hDIpeOvPJ/i+U9WA2sn4JmTUjqXAITYjJ
	whLezLnmdYOgOkOdu8SkcYSRDBibS7pAOY50/iRzf4bFEv3u7/3PbCzf1BkUFO9U19o3X/wF8rxxZ
	SdGQ/VZ+ycHgzPO91JSs/IOM2kJyyUTnzOYKrHI+NxScxlqMKjP5UglfNW5bHGfqIngZiRukjZEdz
	zl1289hDs5VMd/k/1Uiw/H69SPwp5BSQ1iyfL/duCk4X7cmfpWwhql/bjP/FIlaMy5GpmqG+L99G6
	8g+C5iU437GwAlqPO/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcwYE-0032EY-1K;
	Sun, 03 Sep 2023 23:30:42 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcwYB-0032Dt-2v
	for ath11k@lists.infradead.org;
	Sun, 03 Sep 2023 23:30:41 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3aa1254fb45so599606b6e.2
        for <ath11k@lists.infradead.org>; Sun, 03 Sep 2023 16:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693783836; x=1694388636; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XZOoXJhaVo2TGCTIOjDSMSXw4Rlx/I9OKqXOgCPiDnA=;
        b=cFrUSvHWGGmQnXdekcxHUg00231GScmdNu7fJ35/5zSRxhBSlfA/6rxHtD43ywdRi1
         cKa2Y+cq27vCYfRKiTE5bo4EWnhvOXfaDmOnc9QdCJ7DocbUz+eHEx32Y1x3R2xV0HYN
         MrpG2hKmBIUeUKrFVUcyKQoF79jH7aze0zAi3V05zMfqssCOXTTAVZHI5q4/aV0WMoMO
         7oX4cX77FAfsrQH6U2jrS32Ix8HJcqruV1SLIstVATjIr4F9MIr0teFI7pvA3hXCxWL5
         Qc35HZR4lu3jwb+W94RWVDQwJPq+6VB0Ur696+xJTyPVdzNEHNKLd0A1npJ3O7KQJ8Yh
         UN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693783836; x=1694388636;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZOoXJhaVo2TGCTIOjDSMSXw4Rlx/I9OKqXOgCPiDnA=;
        b=CXyWdarlXfmYV4kCmSphDoMtvgxqGLJsyz8SfEFpFEVCJSvFihKCVJLOCuODcylKuo
         sdWY4N1oVdCnapI7f+Ey9g/RWDavoGke7gEWdjVH1ILXLRdQPEn7Khnx2gLfvSYlxl72
         Sga9kesBD54bjM2KQoSNLd/N7zJBbmHX9mBnLCs4cpMDdNfo2LakqdmMmNkmN72FqkBq
         +AkMsfKcSw7GgP6tWqANXX5+CVK1Q5bLsrAvuBT/rke0T+Ooh5OceD2ce6W+XxMhHhnz
         /zOzh6gMX34QDqRoB0fFIMaODT3SNLpzsL7gsvGeddnb2K9reXrkoaOe90hzAZ/E7dBT
         YdIg==
X-Gm-Message-State: AOJu0Yzk/G0RWrTFjST1Mb9/jIodlI3l5RT91uj+Aw5Gi91KJ/KLhX1d
	zVVR2C18lMMc2F7yWeOZKlk=
X-Google-Smtp-Source: AGHT+IE52Ilxt0FJzlGKG879WYPgQGgW7wg05kjjPjvHlrTLhFnh/sEpvS/WCdZUh87TzfzToOxV4A==
X-Received: by 2002:a05:6808:148c:b0:3a9:e8bd:8510 with SMTP id e12-20020a056808148c00b003a9e8bd8510mr10293836oiw.49.1693783836539;
        Sun, 03 Sep 2023 16:30:36 -0700 (PDT)
Received: from luigi.stachecki.net (pool-96-232-116-30.nycmny.fios.verizon.net. [96.232.116.30])
        by smtp.gmail.com with ESMTPSA id b12-20020a0ccd0c000000b0064f59ca89basm3171001qvm.45.2023.09.03.16.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 16:30:36 -0700 (PDT)
Date: Sun, 3 Sep 2023 19:30:59 -0400
From: Tyler Stachecki <stachecki.tyler@gmail.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Atheros 11K <ath11k@lists.infradead.org>
Subject: Re: Fwd: ath11k: QCN9074: ce desc not available for wmi command
Message-ID: <ZPUXMx0H/8U9j15F@luigi.stachecki.net>
References: <1326a6e4-758d-3344-d90c-8a126748b034@gmail.com>
 <6a0c3aa0-86a8-8c06-81df-2d7085946cf5@leemhuis.info>
 <16885654-09f0-c139-cc9b-c6c4d666932e@quicinc.com>
 <ae1ad814-5613-704e-b0b1-4f1fc4bead44@leemhuis.info>
 <1945f748-fb71-f1c1-83a2-ba0470daf817@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1945f748-fb71-f1c1-83a2-ba0470daf817@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230903_163039_987236_05388786 
X-CRM114-Status: GOOD (  14.83  )
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

> On 25.07.23 11:17, Manikanta Pubbisetty wrote:
> 
> FWIW, Bagas Sanjaya just forwarded the report and the reporter is not
> CCed afaics (bugzilla privacy policy does not allow this, which
> complicates things a lot :-/ ). You have to use bugzilla to reach the
> reporter: https://bugzilla.kernel.org/show_bug.cgi?id=217536

Hi Manikanta,

I just wanted to report that this is likely related to QCN9074 when the host
system only has 1 MSI-X vector available for the modem and/or related to a
product named "WPEQ-405AX".

I have two different hosts running the exact same kernel, same QCN9074
firmware (WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1), etc. The only
differences are that the one which does not work is running on a slightly
older Intel SBC, with the older one leveraging mPCIe instead of PCIe and
only having one MSI-X vector.

I tried backing out the threaded NAPI commit and, as mentioned, everything
begins working again on the host with 1 MSI-X vector. I have also seen some
other oddities with the system only working with 1 MSI-X vector, such as
the modem not working when I boot with hpet=disabled. I am guessing it is
not related, but mentioning it just in case.

The only other thing I'll mention is that the CE desc errors are *only* seen
after upping the link (via `ip link set wlp1s0 up`). After this point, doing
something as simple as reading the temperature of the modem fails and the
kernel log starts printing the errors described above. Prior to that, however,
no error messages are seen.

I'm happy to be of service to test any changes you might suggest. Thanks
for the threaded NAPI work, by the way - it definitely provides a boost!

Regards,
Tyler

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
