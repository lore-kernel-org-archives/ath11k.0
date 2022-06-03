Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC28EC433EF
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJHrS3LI7GzyOpL7Z4C+0mpumZcNpef/xy8TcF5Baps=; b=Y5QDCbsM1I0REx
	lh2iM0AiVblzv9wP+D8ssWHAyimWAWOFSKxfPU2X9rNCX1gOxwsJYlrwsFvWXV7S9BKeElyk2qQje
	VpAmOT6sGIkQ8ycHEWykMgBCfGLabrGBwcYZueulFXXxYh23ufrECUUUmofAWRCampCcD4vOXnR+y
	5jsaqHBZUO7U2IqJkvQjtO7ErHDlFSPNLz1TwLJUP9tPq+Fzy88u6LvjaWCM7NvwUzt84Q48feHs4
	bP3i7WGcqrDMzQa6b+SoLvethKacetJ/eCTSD8jQ+XkM/M4HSqn0K8/dbfRxDYeawobjL+BGkxrUm
	dpH0sxHgX084dSgYb/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2r5-006gxm-1X; Fri, 03 Jun 2022 08:40:27 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2r2-006gwT-E7
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 08:40:25 +0000
Received: by mail-lj1-x231.google.com with SMTP id 1so7735723ljp.8
        for <ath11k@lists.infradead.org>; Fri, 03 Jun 2022 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Mx8Ei+fk3lIz6YdPEwBWg7xFi25jgrg1EfkRyUfp0Lg=;
        b=MBHnhTMPHz0GAc9+MsnRcatQx6XRwWrUs7UInh2uRtYAMzoE1PZg13OzhZFoYWBIij
         POin7TBu71+yOyW/lnzBfLdJopBS6a56jmRTt7LJt250ln8SAwzgBOfqNk4M/LaWgV5N
         nveD0HelRRQRrXACeq17GtFR3yq3u6Mey2iS3T5sA7eaSJghoL1SPhoZaGkokWr5TeWc
         LrdTKoZVPHzLD9qpJrV4qsS0DcK8VfYjSRarxRb3qIJqJGgftymBaAx2vAazkXRJ1UEK
         9P1LGHN6c49XBpSdDMf16+kmXI+cuIScAkwQSPXq4T7e/Qvn/J0DMLYx4/l9cb/gqctZ
         316w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Mx8Ei+fk3lIz6YdPEwBWg7xFi25jgrg1EfkRyUfp0Lg=;
        b=n84hG6Gccqoa//zznKuB/nMoqUSVxUrW2tPGDK1eBC5IXFl0Nw7+hnBgCTxIlWr8gs
         bmcj4z7i5jGGtiHu6llOMuBaytjfK6la+Uda/lJ7sNX7bLOukve4w57tEBAB5lBE3H9R
         Ggt24WfADDKHE0a8w8iC7l9z/6J4K+OIeYPLo/GH4xyVR8aRrUEui6cuccDigI8UyIu3
         EDka5s62619DnOzNAtrUBlO5Ac8ASV55w8o46gvvaUfzLDK0kizWNCZwFiQCGIGNNVS/
         yQHRfj2xUi04nkPbCN7mddrzEmTLRaf+0VLjL9L8cDhAIQKWpmXQWTh3akdKX0l791NJ
         UuFQ==
X-Gm-Message-State: AOAM531Ev/2jk7aws13OuEf5/jzJTxukItlcrvddfEXBbjxQ9V7XbTWF
	fanblQ5IZExIQ3xzugrvQp7P0ncLfbv9MVjw
X-Google-Smtp-Source: ABdhPJyfo8le2fRDZ0WNV9nN+QRVTWPTPeMSg6VtvAZodUydvNHfnXu3AwV/IVRTlir4+SIJ7QbPBw==
X-Received: by 2002:a2e:9283:0:b0:253:e175:dd84 with SMTP id d3-20020a2e9283000000b00253e175dd84mr37595843ljh.221.1654245621535;
        Fri, 03 Jun 2022 01:40:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bt42-20020a056512262a00b0047255d210d5sm1475652lfb.4.2022.06.03.01.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 01:40:20 -0700 (PDT)
Message-ID: <f77c78c4-2dee-3798-4a8a-c42abc0e1c6f@linaro.org>
Date: Fri, 3 Jun 2022 11:40:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: WCN6855 issues with latest linux-firmware
Content-Language: en-GB
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <CAA8EJpoHKUSx3Aq+fB-4s0ZpZXfvp8p-==hO12hxsrxE46YfCw@mail.gmail.com>
 <87zgium9dw.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87zgium9dw.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_014024_514804_DD6BD3FF 
X-CRM114-Status: GOOD (  14.10  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On 03/06/2022 11:36, Kalle Valo wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
>> I have tested the latest firmware from linux-firmware and it still
>> fails to send the bdf file request:
>>
>> [    3.740702] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb
>> board_id 0xa7 soc_id 0x400c0210
>> [    3.752952] ath11k_pci 0000:01:00.0: fw_version 0x11090c35
>> fw_build_timestamp 2022-04-18 20:23 fw_build_id
>> QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
>> [    3.760674] ath11k_pci 0000:01:00.0: failed to fetch board data for
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=167
>> from ath11k/WCN6855/hw2.1/board-2.bin
>> [....]
>> [   13.843957] ath11k_pci 0000:01:00.0: failed to wait board file
>> download request: -110
> 
> Yeah, I have a bunch of missing board files but I haven't been able to
> start searching for them yet. This will take time, sorry.

I might be mistaken, but for me it looks like the problem is not in the 
missing board file. I have added local board.bin.

The problem with the WLAN.HSP.1.1 firmware is that it does not request 
the board data file on these boards (as pointed by the last line in the 
log: 'failed to wait board file download request'). The WLAN.HSP.2.0 
firmware loads the board file correctly. The old, unsupported 
WLAN.HSP.1.1 firmware (from ChromeOS repo) also loads the bdf correctly.


-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
