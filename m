Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B002C7115A
	for <ath11k@archiver.kernel.org>; Thu, 19 Jun 2025 02:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FU7hS3nxP2s1VnD1O6EqAa6UCfOLId0EKfwYuX88Apo=; b=K/ZD5w1VlMq9r0h+wUwkhQ/KJo
	A7VAMp2LAQ7Em4jfEdhahmZ17zhDYjvPSVUkv3OMioTghOmauwLxN6Aav8a5eVPQbHDumwj1Js9at
	AJNitDfLktMVLbjYRX8KIhQgoDUexg6wODGCvRh+wg9rZarNwWUfHzQjk9dUtT+fpyzZ5TP8xI/hY
	fnb+VQvRYZtF1GbsWlFR0tVwloReX1HIvFuJ35FtC8NZ8ISgqnu2nqFH2/lAuG0wxiwNzp8b6+eI/
	xL8BMY2tildX7Hm/kLaaKI0Ae65/LkOfOMzYt7KovQ4gKxi671zMKzsl9YCldRM+EqUruGubCjkhY
	DOlonWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS5PE-0000000BrKO-1e68;
	Thu, 19 Jun 2025 02:53:36 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS5PB-0000000BrJo-2vjd
	for ath11k@lists.infradead.org;
	Thu, 19 Jun 2025 02:53:34 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b31d0dcfea3so280978a12.3
        for <ath11k@lists.infradead.org>; Wed, 18 Jun 2025 19:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750301613; x=1750906413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FU7hS3nxP2s1VnD1O6EqAa6UCfOLId0EKfwYuX88Apo=;
        b=XRpHDx7X1jZ7KctP3HqyazE6BypWdqLkRVK+TGmDBHiXARg5zeUkFhjpc0/LWAEokZ
         XrDZrhqbJAykK43+twlVFxEJgM4u3jdZ1KykujKgMpuv4+LSdFz8pTnYBLGuwJivPL7i
         UU6EaTF0ueWyFpDfV3j9vQqWGPPKgzATa0W2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301613; x=1750906413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU7hS3nxP2s1VnD1O6EqAa6UCfOLId0EKfwYuX88Apo=;
        b=Hcbup2a8BrsJZ3skhFnipKGZrvGUWW8BP7xTE4rZ/OJ2T4AdYuwBPWu9MMU+h7dh0Y
         Aw+FDhK7IwD968Fw0PUK6lVW19YfyNFwG+j9r/XsVeydImFdzqsMiJiAVC642i67ot4V
         5swjVmrQ5oDIU+MB4YoGnB7YM0U00h3VROfuUyJ67jp+OGLDp6dMWXoGo7+jdVE0BD/y
         WknnH38onuGoHAfRUeBjw0Fq08HqUg0WhvpkShcCy1AIKY3TQmqusaZjBbOaDYrkAnaa
         d2qbRYdnr7v9wuexihifvubXBzL9oI997fs2MHYN1bmGhlVJA0JZP1PP/DLj9pFsnmjb
         MYtA==
X-Forwarded-Encrypted: i=1; AJvYcCWRTnjHHYP7bYyY8oL2z3JUNDbEdqmCpJud4Lwqm7xjU7V11ZCovOEPHwAqpPovk/vlAImxAoU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfSHpy+gpaYyXAuVUCsQHFTwwuZv4OpUlNHLG2h4lKwFhxXcGb
	oUsETlZEBOQz9mhK4Qvg5gSA+9tMM4579Ro+xPV/g+lq2nNRULZIG9qTH3QkqCDMBw==
X-Gm-Gg: ASbGncs3uPN21NLJHraltZffocRloJUp5quziLJbFOujm0DQLwHIABcc+/oXFoUmYFW
	+TSPsOlNV9hp8TJGyZaNXR9utTWqQRvw/Ifg9KApPlkI8oNrC62ZwP3+5KPM2GsG+pnxt5Ox19G
	KM2535ed7db9S0n2CPtcfJ0dXCIgB+4s8u4dJSzhjmNm6kJ0lvrh+NsBmz1XhSustG8soimuOr4
	2xxNEPNvUZSOJyNmxoTG+FMhr52qHXnQi+SCyJ0FLr7TXpzbnYQ42cYSmL5wuEUl7uzsWxU+fZD
	9/xIwW1liCAaUlhGGXkmJ8z67uzjoDJBhOIynUJp2PIM3SnAXczqR3WJBrGnncopAA==
X-Google-Smtp-Source: AGHT+IGNccPkiKMjhJp9xYP7Kep1hqlT//YVjWo3nk5z9pz6Nus1LaUm0/pUREXGtm7Nq43cBr8sEg==
X-Received: by 2002:a05:6a20:7f8b:b0:220:3a5:43e9 with SMTP id adf61e73a8af0-22003a54b20mr9849038637.32.1750301612935;
        Wed, 18 Jun 2025 19:53:32 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:7cb6:ce70:9b77:ed3b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31c1b48c69sm3688361a12.31.2025.06.18.19.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 19:53:32 -0700 (PDT)
Date: Thu, 19 Jun 2025 11:53:28 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jeff Johnson <jjohnson@kernel.org>, 
	Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv3] wifi: ath11k: clear initialized flag for deinit-ed
 srng lists
Message-ID: <xgypo7y24oxfe57psg6bdzrmvmahx7swb2ifjxqmpteagsdonw@ubrubygzpbyo>
References: <20250612084551.702803-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612084551.702803-1-senozhatsky@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_195333_737637_BD32B2D0 
X-CRM114-Status: GOOD (  12.49  )
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

On (25/06/12 17:45), Sergey Senozhatsky wrote:
> In a number of cases we see kernel panics on resume due
> to ath11k kernel page fault, which happens under the
> following circumstances:
> 
> 1) First ath11k_hal_dump_srng_stats() call
> 
>  Last interrupt received for each group:
>  ath11k_pci 0000:01:00.0: group_id 0 22511ms before
>  ath11k_pci 0000:01:00.0: group_id 1 14440788ms before
>  [..]
>  ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
>  ath11k_pci 0000:01:00.0: Service connect timeout
>  ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
>  ath11k_pci 0000:01:00.0: failed to start core: -110
>  ath11k_pci 0000:01:00.0: firmware crashed: MHI_CB_EE_RDDM
>  ath11k_pci 0000:01:00.0: already resetting count 2
>  ath11k_pci 0000:01:00.0: failed to wait wlan mode request (mode 4): -110
>  ath11k_pci 0000:01:00.0: qmi failed to send wlan mode off: -110
>  ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
>  [..]
> 
> 2) At this point reconfiguration fails (we have 2 resets) and
>   ath11k_core_reconfigure_on_crash() calls ath11k_hal_srng_deinit()
>   which destroys srng lists.  However, it does not reset per-list
>   ->initialized flag.
> 
> 3) Second ath11k_hal_dump_srng_stats() call sees stale ->initialized
>   flag and attempts to dump srng stats:
> 
>  Last interrupt received for each group:
>  ath11k_pci 0000:01:00.0: group_id 0 66785ms before
>  ath11k_pci 0000:01:00.0: group_id 1 14485062ms before
>  ath11k_pci 0000:01:00.0: group_id 2 14485062ms before
>  ath11k_pci 0000:01:00.0: group_id 3 14485062ms before
>  ath11k_pci 0000:01:00.0: group_id 4 14780845ms before
>  ath11k_pci 0000:01:00.0: group_id 5 14780845ms before
>  ath11k_pci 0000:01:00.0: group_id 6 14485062ms before
>  ath11k_pci 0000:01:00.0: group_id 7 66814ms before
>  ath11k_pci 0000:01:00.0: group_id 8 68997ms before
>  ath11k_pci 0000:01:00.0: group_id 9 67588ms before
>  ath11k_pci 0000:01:00.0: group_id 10 69511ms before
>  BUG: unable to handle page fault for address: ffffa007404eb010
>  #PF: supervisor read access in kernel mode
>  #PF: error_code(0x0000) - not-present page
>  PGD 100000067 P4D 100000067 PUD 10022d067 PMD 100b01067 PTE 0
>  Oops: 0000 [#1] PREEMPT SMP NOPTI
>  RIP: 0010:ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k]
>  Call Trace:
>  <TASK>
>  ? __die_body+0xae/0xb0
>  ? page_fault_oops+0x381/0x3e0
>  ? exc_page_fault+0x69/0xa0
>  ? asm_exc_page_fault+0x22/0x30
>  ? ath11k_hal_dump_srng_stats+0x2b4/0x3b0 [ath11k (HASH:6cea 4)]
>  ath11k_qmi_driver_event_work+0xbd/0x1050 [ath11k (HASH:6cea 4)]
>  worker_thread+0x389/0x930
>  kthread+0x149/0x170
> 
> Clear per-list ->initialized flag in ath11k_hal_srng_deinit().

If you are with this, can you please pick it up?

