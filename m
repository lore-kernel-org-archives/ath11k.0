Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA52FC4345F
	for <ath11k@archiver.kernel.org>; Thu,  2 May 2024 19:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtKJAto7Q3Nrk05RW97KRPIs8n7BxL20FUpybZ4BUYg=; b=ig0G8nWAPsyDgot8m8aHJgAyfI
	ZIw5LOcg5HhlU10VifTNTk2HuBblyM6qtuYF5VaixW+uWn+HbAqgBNnOyYQ2nZNx9hbSfEtqCOfWR
	n+mn8jEv8/B0iH0fq8O+34hoHWBBfE4WLWWHPGjlFLtoPBxGn1LFDDPE0IeBO+yPpupe5qKCuVVcR
	d1baowU9wjRlr8upWr+/l4uU9A3bcIEGWyvQ4wLSBACPRtsm/H6RxBSpy81i7waXq6vd6G0rCbr4V
	DxKvbm2Rs0C5CfA9+X8F5bHPaQHofnPQOYtNpGK/bQ3oMP27SCeV+IR+eoArW2xrbE8KCXnPpw0ZV
	haV2h6lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2c5P-0000000Dj0j-0jJh;
	Thu, 02 May 2024 19:27:19 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2c5M-0000000Dizw-0x6b
	for ath11k@lists.infradead.org;
	Thu, 02 May 2024 19:27:17 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-51f036e9f4dso1581635e87.3
        for <ath11k@lists.infradead.org>; Thu, 02 May 2024 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714678032; x=1715282832; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtKJAto7Q3Nrk05RW97KRPIs8n7BxL20FUpybZ4BUYg=;
        b=WNvjag/Z4HW+DHzRcHFlbl1pTxyXk/TdF0jRFQS4r7vLi4F8gLijNr4RyNAV+z598W
         WndrDEW+ubxZT8UiB4UIanZllmyPF7MsiDkC4voTnKtg+se21L9bFAeUNKntTZwCAbbQ
         L9kL9aWGvAGzt123S7EoccEHLPIbAnioKqKsp70/6C78fZ43TGrk/LgmHeiM0OfrQ4tk
         3xhJLt+/iCnAO1IMGLQCDK23Jc5yDJo/Gbcbpw8zd7eho4L9iI7RMZtee0PDAx6fYWs+
         Ec7PSxJ4k101HyNBa70a1ALAQD91wCFq8l2wk2BTQt/CPZPOvve1z8Nd+rHdPTuvrXFY
         xGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714678032; x=1715282832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtKJAto7Q3Nrk05RW97KRPIs8n7BxL20FUpybZ4BUYg=;
        b=jxc5/LK+jbMalIkadT71rPjvg9iMmROjhyx0M72Y4K8BsDV1ETtGtBzNM/p4H1MOzH
         3rrywHQQMMEt/pFvHVZV0LMFunatZ3q6bSvvz4t0U7yUMpzpV3hOSPWxMdfHNG6g7Kt7
         cknIRYKGhMagTr6IlHIP5taMVDNOlMzVa1egVitbv/jIDc2z074W7Rt7WtS1JGmsyZ8N
         GESOYYhtpRCV7nxjq6lR0/iF7Wbr2tgHrYbhgJcomr+3S+kG0kh1fIFN9/qFhGDhxI5D
         CQpjbGdDOz3NZuLJRPH7lg8I6fYkRLed3UGT18J2ZmeuLfBUZ/j64hiXhVIl4B988JIT
         HdIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWke7yGxonpWzvk+0B7XNsBYIQ2KW8V52sxpZtYb0H+ZzPL0bDpiT2L2WQ4PyEl2jTK9FBp8kfUW9rfwTpmhMMQwtAsnJrk9Q16A==
X-Gm-Message-State: AOJu0Yz82PxCvYwfDNd+VLOnI22hiqboq8YEAvTUOHiwSX2D8aIC1V+q
	eTQO0usiZmJiOAbmiV8esrSbeWT9nC+7DpU4qShX0bgoWwh9o/uq
X-Google-Smtp-Source: AGHT+IFFNDxSJm2KpR0fG5ZXjxpbPk+Pv4p9QZiBiaQUu/wqpNaZUPQ+qYlm5jagNz+nyDjmWHB11A==
X-Received: by 2002:ac2:428a:0:b0:518:dfed:f021 with SMTP id m10-20020ac2428a000000b00518dfedf021mr494477lfh.24.1714678032304;
        Thu, 02 May 2024 12:27:12 -0700 (PDT)
Received: from [192.168.1.105] ([188.113.43.9])
        by smtp.gmail.com with ESMTPSA id s12-20020a19ad4c000000b0051c5570f573sm277186lfd.23.2024.05.02.12.27.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 12:27:11 -0700 (PDT)
Message-ID: <b3999eec-e370-4c85-80b9-759f25ed98bf@gmail.com>
Date: Thu, 2 May 2024 22:27:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix remapped ce accessing issue on 64bit OS
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Ziyang Huang <hzyitc@outlook.com>, kvalo@kernel.org
Cc: jjohnson@kernel.org, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <TYZPR01MB55563B3A689D54D18179E5B4C9192@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <6336ffc7-d8ae-4cfd-8b66-d6d91cb0d15e@quicinc.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <6336ffc7-d8ae-4cfd-8b66-d6d91cb0d15e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_122716_301114_0D2D680C 
X-CRM114-Status: GOOD (  14.75  )
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

Hi Jeff,

On 01.05.2024 19:56, Jeff Johnson wrote:
> On 5/1/2024 9:14 AM, Ziyang Huang wrote:
>> On 64bit OS, when ab->mem_ce is lower than or 4G far away from ab->mem,
>> u32 is not enough to store the offsets, which makes ath11k_ahb_read32()
>> and ath11k_ahb_write32() access incorrect address and causes Data Abort
>> Exception.
> 
> Are you actually observing this issue?
> Or is this a hypothetical situation?

Yep. This is the real issue. I faced it on IPQ5018 with 64bits kernel.

>> Let's use the high bits of offsets to decide where to access, which is
>> similar as ath11k_pci_get_window_start() done. In the future, we can merge
>> these functions for unified regs accessing.
> 
> Performing unnecessary tests and masking for every ioread/write operation will
> potentially impact performance.
> 
> What other fixes were considered (i.e. did you consider making all the
> register addresses u64?)

Probably, making argument u64 could also be too much. I/O address space 
of this chip fits 4GB so u32 should be enough. I have a bit different 
fix for this bug. It introduces an indirect call for the CE registers 
access and a dedicated set of accessing functions for chips that has the 
CE region outside the main I/O area. I am going to publish it in a 
couple of weeks, when I will come from a trip. The patch still needs 
some polishing.

--
Sergey

