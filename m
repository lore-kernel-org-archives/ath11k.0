Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2F3C54E64
	for <ath11k@archiver.kernel.org>; Thu, 28 Mar 2024 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=627mkCdVGao7oDK8Ssw4iDjUepk9Kg1HbgzRtecPuMc=; b=iy1O+1xReHyyqXXzbR3cj4+xPV
	apgLBj4Y+hhmLAHE2uFHqK6/9wcfXZfjR078tkkneYcO5M3etrys2VErZ9KV9yDsQ5JgGmOYqBPfs
	vjbT7qG6y7tOlDXpMRQcGZCK1XWxFKDdoqZoSermXNgd9Ow2B5rpzO+mPcElikFrcv6kCnaDIuErM
	IjrCZ/1ksq9bAH4v7WHNZY3u10UWGsjkgKaYFViibKmiJ+kGP968g/kHng+q1WA36mZg/mstHzV2O
	czLRS2mEtjJEVdKAQ/Qg66UfBchDG8E/95RWS1Cq/7SsqrMOIMSrvR9iekSfd2OriwLJOu5yYJ0ht
	mYWggPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqsX-0000000ELyy-0Xts;
	Thu, 28 Mar 2024 14:37:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpqsS-0000000ELxo-04Xi
	for ath11k@lists.infradead.org;
	Thu, 28 Mar 2024 14:37:15 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e0878b76f3so8315945ad.0
        for <ath11k@lists.infradead.org>; Thu, 28 Mar 2024 07:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711636629; x=1712241429; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=627mkCdVGao7oDK8Ssw4iDjUepk9Kg1HbgzRtecPuMc=;
        b=LVUYIqGM0tTA6iozmOp3+EUS1S3u4b8/NZk1TZnO/XxSjyW8qKkBRfKCiLESRk0PzI
         uKeawr/9xEYhkoaLiWx1nn/f7u9BTTg72VLEKFVTyNz5Y+fkYt6vJzQ5fqTz5fBFdKHP
         sd29Jg/GsLIBuZLTzAtvG0psEZ+1zDulM4+IKtdWuAwzJMSZmemAhIU9oBVrq/e0+W0C
         YSIZGA1cmINkBz2EVRMksg3EZO2wsiUsN9qlDybjljM54U68tG4tPyqkJjozczOBhtAZ
         0aMeKZb9xITiWV8JSP3CgJh7wubGbhahlYEgQLIFSRJYraoFqd1CAEV4LYwn8HjHvDtt
         9zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711636629; x=1712241429;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=627mkCdVGao7oDK8Ssw4iDjUepk9Kg1HbgzRtecPuMc=;
        b=w5Ix1kQeOcxIEmyfwk5W2AjPORfduam9vlp1aGebpDL1z7T3bcH5RtQng9gFp61sx/
         R5UrYyf7ByhTORC2SFypuS/aQbTV+u5fcznPBL+zap8R5Aybzk7vjqMAPD81U/glBPn2
         RziJyJ1y6MIp4Qcg6wqxEjg7Rej9N1pZdbRdU1BD1u5vajNZIaFqxZ9Jxr1BeN2e75pk
         fmrQlNcdWqLjvCH3Wu/rkefO8MZiuY6PqpkwEtKok6prhv8l3zxqbb+GFkVROv9SWJxa
         0GmVq9lYBMIK3qUQFDGPFZ33sII8OteRM+dJQY0i2GSDkhSMhUH+IIWWz2PrZa9Sc6kB
         CfJQ==
X-Gm-Message-State: AOJu0Yyr23f7yywT9fvBxXqFXnMljTZ4zRMkdSfbjQUnKWg16Zbsaqw/
	v0PWkuEfuhZ+o+Z3nQw7K6OYfG+CymfmjqVjY+9eIBPRVvQxZwDgAeJop1VB
X-Google-Smtp-Source: AGHT+IG6QHQI1QO4neaXgDVm+rE1f9V/zg1wj8Y2RJDezlfk4u6wZ9fdMUFm2NR4OZgmVDeMoxbEMQ==
X-Received: by 2002:a17:902:dac3:b0:1dd:1c6f:af51 with SMTP id q3-20020a170902dac300b001dd1c6faf51mr3618780plx.16.1711636628657;
        Thu, 28 Mar 2024 07:37:08 -0700 (PDT)
Received: from [192.168.254.87] ([50.39.172.77])
        by smtp.gmail.com with ESMTPSA id l16-20020a170903121000b001e0c956f0dcsm1643887plh.213.2024.03.28.07.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 07:37:08 -0700 (PDT)
Message-ID: <e458216d-b389-4abd-a9b2-90525ea10a8d@gmail.com>
Date: Thu, 28 Mar 2024 07:37:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k failed to enqueue rx buf: -28
Content-Language: en-US
From: James Prestwood <prestwoj@gmail.com>
To: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER"
 <linux-wireless@vger.kernel.org>
References: <5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com>
Cc: ath11k@lists.infradead.org
In-Reply-To: <5c63a3a2-29fe-444c-96f1-f87c89d7af39@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_073712_077271_4F7738E8 
X-CRM114-Status: GOOD (  12.29  )
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

+ CC ath11k

On 3/27/24 9:25 AM, James Prestwood wrote:
> Hi,
>
> This error was brought to my attention in the kernel logs and I'm 
> wondering if it is of any concern:
>
> kernel: ath11k_pci 0000:03:00.0: failed to enqueue rx buf: -28
>
> It seems to happen every few minutes or so. I don't notice any bad 
> behavior associated with it per-se, but maybe its an issue of some 
> buffer needing to be increased in size? Does this mean a frame is 
> being dropped due to no room to receive it?
>
> Hardware we are running is:
>
> [    4.610399] ath11k_pci 0000:03:00.0: wcn6855 hw2.1
> [    5.777030] ath11k_pci 0000:03:00.0: chip_id 0x12 chip_family 0xb 
> board_id 0xff soc_id 0x400c1211
> [    5.777039] ath11k_pci 0000:03:00.0: fw_version 0x1109996e 
> fw_build_timestamp 2023-12-19 11:11 fw_build_id 
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.36
>
> Thanks,
>
> James
>

