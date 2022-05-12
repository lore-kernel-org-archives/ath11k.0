Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BA1C433EF
	for <ath11k@archiver.kernel.org>; Thu, 12 May 2022 21:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9uSWeJaQ8whbZmlD1wehZdDRGosaVADXkCV1nx+Xh5g=; b=QeVDQaPt8D8XTo
	sCWSnlBkEWJHuwjmkL2MuXvfezqyuPs/4Pigo1Ecuars3ZkpJ59k6kR+bSJNsnNf4kWxJsmin8fi5
	tv+cs6C71ybK5gHWnEj+YUe8ceTs3cmoVyP6F8RvkJGPvhymVQfKDFxcVxAeAMLY7thWsmF/XIZ6h
	ImC1pys9Ax5teNrTQPWR0pYeE3cb+8JNxB6a1twAV09EQv1uZGFnn3oxVpXKba5witto6vO9vvxdH
	FooCJZiRD8rQyvpcKhkMcQR4wQ+5WrfQ+4cmd80+122TFmnDP0OhZoc309PrOxKl7J5cYk2u8CDt4
	SxHAnMuQ5247YqTbZ+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npG2n-00DXhd-9K; Thu, 12 May 2022 21:08:21 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npG2k-00DXey-8p
 for ath11k@lists.infradead.org; Thu, 12 May 2022 21:08:20 +0000
Received: by mail-lf1-x12d.google.com with SMTP id p26so11206739lfh.10
 for <ath11k@lists.infradead.org>; Thu, 12 May 2022 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rPtyjeMxoo2OSzjjj9x/Zl8UUoy105fMM5VV18uK9gY=;
 b=vTVlMVfjRFLQpnK2Clu/iABOvJxwbRmsSPv2/BSAKGU418rshv/IG6cSQyAhIW9WnR
 Sk0QJED1TUudl5Ox7wauol/f5C5+JQQnL8uL4X8POsB5U0/ZL3MIW7nB87jAw3Sg6sKl
 I4PSlE+PVmJlHiflrqbEVF3t4l4kA08H0T8KXMtmzrsEVb/QxltajtM5Oz/RILgR92W1
 Pjb6R6f2fV0MwQJGafFSqqMiJZzuDuyHWbuMob/nW6gsnw8M5BZyreu6kbe0gIN3aKCz
 bQF4t50Ihs6RKHBoROb7/gptwyhM60dwwS9lm/bm9ot49KMwXtkttO1+MDc7suNtuuB3
 wiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rPtyjeMxoo2OSzjjj9x/Zl8UUoy105fMM5VV18uK9gY=;
 b=qOh6TZ1ptspqM9o9RR5xfMxd1o13Wr0DTNOXzKV5mW68rEO4Vs4w4g46KqXinA3YHT
 Ts6/Tk5oO2bcM+2bAWDgRYKAwkUFwZemOxhL6dkEiKz3W/ZnfDsL8svrXisaz00TrP2B
 wzpU0/2R8KXjC/K3rSnkyzW8TTkLU8+dfboUmL9XX+7+lLq7QICZB5twr9/xUn4EwTNQ
 0P5kfriSDv/AO/94JM10XHNEnGU7rx+uxHYSkzgW8/opp2Yi/kzNO4B/cBnU4F8gY1YR
 lRxivZQl/ZiiiM1xbDYC40LmzHTqsxiUE/lc28J7WHrDD3AvmM0BxzIfGwGvShmcOe+l
 TOQA==
X-Gm-Message-State: AOAM530A6hf/2oasaTlYbgSslJOzJLVMLlPVnyD8Yskv+OmQtpighi/Q
 uOgDFwqcZhQLB4oUfejiBOHtSw==
X-Google-Smtp-Source: ABdhPJxpXN9SGkAFFq7NKcWagAuHHccw/jVK7SufsF8fskCNMhSDa7002IBXLJlvOjhq7zoLNa6k0A==
X-Received: by 2002:a19:4348:0:b0:474:d376:45f3 with SMTP id
 m8-20020a194348000000b00474d37645f3mr1099866lfj.405.1652389693828; 
 Thu, 12 May 2022 14:08:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y19-20020ac255b3000000b0047255d210d5sm96371lfg.4.2022.05.12.14.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 14:08:13 -0700 (PDT)
Message-ID: <627e4f7d-4332-d46e-82e3-4f3f18d3b546@linaro.org>
Date: Fri, 13 May 2022 00:08:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: WCN6855 issues with latest linux-firmware
Content-Language: en-GB
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
 <87v8ua624n.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87v8ua624n.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_140818_365454_BD707061 
X-CRM114-Status: GOOD (  15.20  )
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

Hi,

On 12/05/2022 21:23, Kalle Valo wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
>> The wcn6855 WiFi chip stopped working for me after an update to the
>> latest linux-firmware (Linux 5.18-rc2). I can reproduce it with both
>> hw2.0 and hw2.1 chips.
>>
>> Here is the set of kernel messages I'm getting from ath11k_pci driver:
>>
>> [    4.422391] ath11k_pci 0000:01:00.0: Adding to iommu group 3
>> [    4.429571] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
>> 0x60400000-0x605fffff 64bit]
>> [    4.437857] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
>> [    4.445323] ath11k_pci 0000:01:00.0: MSI vectors: 1
>> [    4.450375] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
>> [    5.378488] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb
>> board_id 0x8c soc_id 0x400c0200
>> [    5.392898] ath11k_pci 0000:01:00.0: fw_version 0x110f0c35
>> fw_build_timestamp 2022-03-30 09:05 fw_build_id
>> QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.7
>> [    5.420648] ath11k_pci 0000:01:00.0: failed to fetch board data for
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=140
>> from ath11k/WCN6855/hw2.0/board-2.bin
>> [   15.686398] ath11k_pci 0000:01:00.0: failed to wait board file
>> download request: -110
>> [   15.694530] ath11k_pci 0000:01:00.0: qmi failed to load bdf file
>> [   15.700784] ath11k_pci 0000:01:00.0: failed to load board data file: -110
> 
> What WCN6855 hardware are you exactly using? (make, model etc) And what
> board file are you using? md5sums of all firmware files is the best.

I gave a try to all wcn6855 firmware files present in the 
ath11k-firmware repo. All of them provide the same behaviour.

However, for the reference, with the following firmware I was able to 
get it to work:

[    4.240309] ath11k_pci 0000:01:00.0: Adding to iommu group 3
[    4.247454] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem 
0x60400000-0x605fffff 64bit]
[    4.255706] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
[    4.263119] ath11k_pci 0000:01:00.0: MSI vectors: 1
[    4.268164] ath11k_pci 0000:01:00.0: wcn6855 hw2.1
[    5.249568] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb 
board_id 0x8c soc_id 0x400c0210
[    5.261639] ath11k_pci 0000:01:00.0: fw_version 0x200f0504 
fw_build_timestamp 2021-11-30 18:48 fw_build_id 
QC_IMAGE_VERSION_STRING=WLAN.HSP.2.0-01284-QCAHSPSWPL_V1_V2_SILICONZ-1
[    5.333813] ath11k_pci 0000:01:00.0: leaving PCI ASPM disabled to 
avoid MHI M2 problems


# md5sum /lib/firmware/ath11k/WCN6855/hw2.1/*
94a63f17bb674e005981b69354921705 
/lib/firmware/ath11k/WCN6855/hw2.1/amss.bin
7fd1c2337b0b6502588d3141e205e735 
/lib/firmware/ath11k/WCN6855/hw2.1/board.bin
62c2087843435b8fd5bafeba7d769a68  /lib/firmware/ath11k/WCN6855/hw2.1/m3.bin
3c61a448699d9e8614212c535c31c096 
/lib/firmware/ath11k/WCN6855/hw2.1/regdb.bin

Any chance of getting WLAN.HSP.2.0 firmware into the ath11k-firmware?


> 
>> With the earlier firmware from [1] I'm getting the following trace
>> (and WiFi device probes). Interestingly enough the chip_id differs
>> between these firmware versions.
>>
>> [    4.352661] ath11k_pci 0000:01:00.0: Adding to iommu group 3
>> [    4.359192] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
>> 0x60400000-0x605fffff 64bit]
>> [    4.367466] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
>> [    4.374916] ath11k_pci 0000:01:00.0: MSI vectors: 1
>> [    4.379963] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
>> [    5.273930] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb
>> board_id 0x8c soc_id 0x400c0200
>> [    5.286020] ath11k_pci 0000:01:00.0: fw_version 0x110406b8
>> fw_build_timestamp 2021-01-08 06:14 fw_build_id
>> QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>> [    5.312464] ath11k_pci 0000:01:00.0: failed to fetch board data for
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=0,qmi-board-id=140
>> from ath11k/WCN6855/hw2.0/board-2.bin
>> [    5.384315] ath11k_pci 0000:01:00.0: leaving PCI ASPM disabled to
>> avoid MHI M2 problems
>>
>>
>>
>> [1]
>> https://chromium.googlesource.com/chromiumos/third_party/linux-firmware/+/d233ddd89abe06448070471963a58c0a7da81d79/ath11k/WCN6855/hw2.0
> 
> That looks like an unsupported firmware version. I recommend using
> _both_ firmwares and board files only from ath11k-firmware.git[1] or
> upstream linux-firmware[2].
> 
> [1] https://github.com/kvalo/ath11k-firmware
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
> 


-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
