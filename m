Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEFCC71136
	for <ath11k@archiver.kernel.org>; Thu, 12 Jun 2025 09:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FpYtQBVzdFUn1mP60IhVAt0dlEC8nasoUhcUFbuwbTM=; b=qaFyC5WpUhNvdh27bPw3nBPm9A
	TFzAZ32SLlfH0NGJkfWOKN0jQzbbuAKhPDAZnW1ByOx4UiyGqjsjARFC5RCA+Lx1McdLZuMcFNaqL
	Poj97b9vOrZtLeCAfjvTgq9doVaK5+9eP1O7r4Rte0HPk61kCv6fTc4x7QkhT3g5Ev8PK+V44xxsE
	KLBPwgx58JwFdOf2m1UtR/wLLV9qkEgbz+lFn2AIztg3SX4ZRr3biQaB41hZ+wB3D7YYx6K6IuB4v
	Na11nWD6FEQp1vk2BDoz6hCk1Wjed20iJnCbYqEN9aGA/SlFPN1Z31M471UecamMQpGsM96UYlhl8
	FTlbGbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPedB-0000000CsNK-2ENt;
	Thu, 12 Jun 2025 09:53:57 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdKz-0000000CdKL-015s
	for ath11k@lists.infradead.org;
	Thu, 12 Jun 2025 08:31:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-742c035f2afso574109b3a.2
        for <ath11k@lists.infradead.org>; Thu, 12 Jun 2025 01:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749717064; x=1750321864; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FpYtQBVzdFUn1mP60IhVAt0dlEC8nasoUhcUFbuwbTM=;
        b=SkbTyKeCdEGmEX4sfyZJbY0vs4YSQK7g+1ZntmeMUTb1ZC1GQ3ZFELrk1BjU7gkX1d
         Xl6sNT2y3IzK9aGch4vuOWWO1esw/W5tYXBvV2v+FIMxSW88lnjNdD6J+/tYvi7MAFfU
         9P4MpViNSkFz9Snf5dGVBZNDapGOo706SbS3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749717064; x=1750321864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpYtQBVzdFUn1mP60IhVAt0dlEC8nasoUhcUFbuwbTM=;
        b=eAb1M7ZuexbpHiFZKrQDGadZS154HFQsWjR7ELJq7v6Tq72h3XshZ4MNe0llxpK2Br
         mglmgRBlHHTPluEwMX16coCcxxsGkMF1RdPbn8eUCMbLN0s4ReZyOrRzSsKasXHbcQJn
         RJ/ho23CWoR2QE19GYz9O8oq13Wp8tGvtmAxNtH/o1cP4myTnqlnVre8ZU/YV4kv+ZzL
         gYqtuK4MjNTN3WY8h2STXECm0NmaHC3kdDB7oMxwcF6X4KNmKCJh8GrzWxu1OAnEikJH
         WCAtvtXqUVhjgWXtKzfxKYbRLBg4BkEkpFgGVW00GEcXAWbHOKWFwSZtdk7BjHlYAweb
         UiDw==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZSnz0PKN/DK7ADn/7kdlVv1jtg0WDhEHRgNFkSm+rdQfnLx6IrB0vfTQa3sbYmXnapIWiDM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIPaFp2SAVA8SH5DWxiu96ieZV1GC4jqPFcvjpuxmDylTRcQJq
	lB+PslCH1M3B2nbKQHH6OOE4qUVjJzmbmmzYEzOx3SIg7rTgVpVkfurSUJ98sIv/+w==
X-Gm-Gg: ASbGncuMO1DO1j7wfDhbFuNqeUk3NSSo6g/wMRZVcU6rv//W6gHEz6y3eLLeNvKOwTU
	TzXhuHK4NZT2Mu9DFH6ylvOUzxvLtFCysIuG82lc+m+gdoC0PkU1gCtq8GaecuuGDCaFM5QuZ69
	Kd6iUl8RvSH9jEwjpGAH1kRKqJ9ZTYKm9Ov0ryykIMAQc5qGw8Tm6qiaws3XYB1zytbgCOgWlvg
	kKlvtz4gN+VhFTeqXEEPCrq4UMbZgWksXs+1VooYSQuYawUkh8GYB+UacQoD/Ug/3+f/gZ5CIeR
	ff7FiA7rRSJjxkkbthfqtT6PXGF9161/JcqQ7MnaUCd1/DbaxAxO42Ase4/D7K14
X-Google-Smtp-Source: AGHT+IFBDWKNu3QDY5x77Ut+39tjoSMCPpg9YSXyyw7wdPIMWMB03qAOxrhzC+O4LvEzlruhxyx/fg==
X-Received: by 2002:aa7:8882:0:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-7486cb21c08mr10126036b3a.3.1749717064126;
        Thu, 12 Jun 2025 01:31:04 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:fcb5:79e0:99d6:8d5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488087aa41sm893458b3a.31.2025.06.12.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 01:31:03 -0700 (PDT)
Date: Thu, 12 Jun 2025 17:31:00 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] wifi: ath11k: mark reset srng lists as uninitialized
Message-ID: <kuawjsglndjvwmq2ki2kctvgcdci6mhfp7juux7tzo3g6h5txh@hddxo4o5raea>
References: <20250529035708.3136232-1-senozhatsky@chromium.org>
 <5857380e-ced9-4118-b9a0-ce926b25c11c@quicinc.com>
 <rxaibpgtf37w3th5lnt3w574w443yononqjoglyfktlcxe26qg@jpmtkckrotzp>
 <2f77045c-6763-4fc4-bf09-50fd9b76a394@quicinc.com>
 <xr3n5pbohquhaloonctfqvpb2r3eu6fi5jly7ms4pgcotqmqzh@msrgbaawafsj>
 <ce3c0e51-4df0-4164-adcd-e98f2edee454@quicinc.com>
 <qqhs2mzhg6mgq23wej5a65iau4ysfjh2raakcsvwc4fuqtpwk2@4ouqfld6mrnd>
 <d48a228a-5f48-4732-b12d-78f03541ae9e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d48a228a-5f48-4732-b12d-78f03541ae9e@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_013105_038920_7C0A8682 
X-CRM114-Status: GOOD (  11.03  )
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

On (25/06/12 16:14), Baochen Qiang wrote:
> > <4>[23562.576034] ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
> > <4>[23562.576058] worker_thread+0x389/0x930
> > <4>[23562.576065] kthread+0x149/0x170
> > <4>[23562.576074] ? start_flush_work+0x130/0x130
> > <4>[23562.576078] ? kthread_associate_blkcg+0xb0/0xb0
> > <4>[23562.576084] ret_from_fork+0x3b/0x50
> > <4>[23562.576090] ? kthread_associate_blkcg+0xb0/0xb0
> > <4>[23562.576096] ret_from_fork_asm+0x11/0x20
> > 
> > 
> > There are clearly two ath11k_hal_dump_srng_stats() calls, the first
> > one happens before crash recovery, the second happens right after
> > and presumably causes UAF, because ->initialized flag is not cleared.
> 
> So with above we can confirm our guess.
> 
> Could you refine your commit message with these details such that readers have a clear
> understanding of this issue?

Sure, I can do that.   I didn't want to throw my guesses into the commit
message, stale ->initialized flag looked like a good enough justification
for the patch.  But I can send out v3 with a more detailed commit message.

