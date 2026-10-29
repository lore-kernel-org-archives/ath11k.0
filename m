Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB79B606A31A
	for <ath11k@archiver.kernel.org>; Thu, 29 Oct 2026 05:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y2mm2dB8;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dWbKoIjO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LiVRgTxN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L1hwVhNMNrZDpSp9Zo6hTIicT+T/hSEE+lSDb02eR3Y=; b=Y2mm2dB8nO6UTa
	zKWRN0aXhYKJsgVm0+jpRkLrnGVimXg4KFawH1L+1UlJpAa8aW6f87mUlbH4/7XtE6kSEz6hrGVm1
	NyDfDW4pSXpcleXOBtRob6QvUgcqgiG4if06lZWftGknOx6Zg5CfMd4oUAZLeFJjObBB8vjorvSQU
	VnjkAmFNsTITcKbjltuuIPq2ImCNCurDAhTgja8cigdpnhfE9FIROU2vKOA7hJooo1tarXKYii9hu
	MkqtUDj6PNti+pUerbN0LnBHKVi1/U4ppHc91vUc5KrkeIzyqYllrEpXvi0dmi9SQdwQLV4EMDYXe
	Rbi9tkHdgEC5Sq+7sztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIPf-00000008OAC-2G52;
	Thu, 29 Oct 2026 05:10:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIPc-00000008O9o-3phI
	for ath11k@lists.infradead.org;
	Thu, 29 Oct 2026 05:10:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jYeJ1975363
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 05:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L1hwVhNMNrZDpSp9Zo6hTIicT+T/hSEE+lSDb02eR3Y=; b=dWbKoIjOImTRjj8I
	eqgt4lsHWxR6UWkUQI3vdsbE3OvdnGwWFTZGqmg3PNN6C1qvsJmsVbFGcNvzt/pb
	GiOY260ngBVwX0QX651igqVwyq6WgxgOAsFLXTV8blErYlf+6dITv0vA2KAl/kJ0
	7vDvJYycdVXyTMLBpIalvukZV3aCPM2nxKfPiStfRQn8npQGWOuLDzPVjxQW63mn
	XnzjAfPGhkOMRJFPh2yRq9NPzTyIVJFERDuOMDmMLANmFjIt6tolmZt2R6SiAu1g
	GeHeXrquAc7Q050Cuy4K3mQPNwNMwg+FuRYBLEbpeAUGZk6WMl4iS/0XWgBgK1FP
	SyFWjg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2abqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 05:10:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so3652398eec.1
        for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 22:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793250646; x=1793855446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L1hwVhNMNrZDpSp9Zo6hTIicT+T/hSEE+lSDb02eR3Y=;
        b=LiVRgTxNGsHlU3Sd/Ga4Lya2qaaDfiA25TAvF+3YxDyUOtLXUDBL2ZP0PI5BMWSqc8
         GtXEaC1TdWcHHSNEpsvqz06B11hjJTWX2g3vHURyhLph3QGuCWcypr11irUC2dy5rQCP
         03BQvYoxG2zeheNyZKpFssyPyx17vX/nbSY25qnKia1PIvHZNCBc0bfqBsORCYGj7qM2
         JLMTMIik5gcMS2h7pNu0KfUAYuwbs4pbV2gaaFonEPozcvntJg0b6SAF1Y1ocOB9MIB6
         Fg7LYgsKgPV0myAzCXlcmwLY/XSmDv8nihPUZaxu98PWKpOurEjjupYnbUw4XjTxPhdM
         t4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250646; x=1793855446;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1hwVhNMNrZDpSp9Zo6hTIicT+T/hSEE+lSDb02eR3Y=;
        b=t7q5GRyiqZVgfREtCUD9o/1aONLuSaIiXzdBKCfoMqgik4lS3BCtUIZmcdepxZNDjB
         Svus7n33+RAfXuJwcsVAviIDBouRL2q0Dm7BgziH3w7+cCZ1auCGFywPhBA6YPFlK0Uq
         hZmlJaeOKyDeRrw9SlkjGzqmDk0k/t7QXYEG8u1ELxLAm3rK1mN/4OqE3wSjbqOImajD
         HbN1mfZXITe+4AEIuI5V7k6r2U7ELofilHVSnYS34BpLYC7fwRnpvSHbBsyOfnfIzvjN
         /rMUIzxKYYqgYKVMSgAF7HjR8O9ul7pzhH9Sc29sS5YKgNHk269nh9OFkfn9N0zlvmPW
         2tag==
X-Forwarded-Encrypted: i=1; AKwUvBxKSZZ8OTYJKfPsRcGZq+UAUJGnpXryEXYE024iTsBBLRBhwfhVYKRgvN7MGeZ5mlJelv/gll4=@lists.infradead.org
X-Gm-Message-State: AFq9FYKLm0i+eCNb8hrHU508kO5RhQ1LYjMnlVw8mvAjGOPx0WIy8qRm
	uyDV806d6FT/UPmrYj25D44luVPXTCWwjz9S0HQue+5JbPIQPzU9UwFd0bJSe5LGNu61lud+Uci
	QjMhL2CkYeR6qa7N6cf/Pi+P2EL/XPvwXaJ7V8ew0Ky5jbiQzjCfYWlV8PueeivFKkZKoq+Em
X-Gm-Gg: AYBFou0G6ni5+KrJNy1sHPiEJhB75xKplXL8mXfEb7JzN5mIxp1oq3zb7ltEfmX9ixI
	H1Vyn+H3g/AKs/eZwnRZeauzPEt4HePiMhsjVra66873wdo7cJEp0NGE2t2tkqpgvwRa/2OxfU0
	i8hj3fODP0P6/fUkYBKNOY+sMPhMkD3YEXmyeQuaR4afo3ejGAkuKDdzdLTagKRswctcACMO2Op
	YO2fiWXmtgaSodylrVGJ6eMIzwucnYL234mjgcKXmziqoRZmQW5D2ItgLJ18JyM4VnrHzYWLvAn
	syCbNDMdbRqrMO9qHcr+H4C1DdFZvUdMvjcIhSoYFK3ttQ+f5O2nUZ3BDsqtPo3TqxjEOutB890
	p0bORqOHcUogspUxrFWgTTJQDOY2kfDWYIUn4zBWXyhUjy+mEH4PWSg49g8SGroIbCF4kX8tzun
	XOTQvOKDXwZ0PAcg==
X-Received: by 2002:a05:7301:1407:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-36a203febbdmr6925382eec.19.1793250646100;
        Wed, 28 Oct 2026 22:10:46 -0700 (PDT)
X-Received: by 2002:a05:7301:1407:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-36a203febbdmr6925342eec.19.1793250645462;
        Wed, 28 Oct 2026 22:10:45 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm14113652eec.0.2026.10.28.22.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 22:10:45 -0700 (PDT)
Message-ID: <22adbcac-94a9-4528-90fe-ad5ef2b00974@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 10:40:39 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Unprepare MHI on power up failure
To: Vladimir Zapolskiy <vz@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20261028104336.1686334-1-vz@kernel.org>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028104336.1686334-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae2d556 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZPdQ_4gUyuuPvppjJ1YA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: AN-rXp09P2koCaSSOM24XYnxXDk-nAlv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxOSBTYWx0ZWRfX2asjvPFcK9bD
 SHhe61ocm+4yjZ+JuLnnqOEcX+lqg7x2XP0H0nXXiJ6S8z5y+ecbtNZuIazqerJPDGIp7EAUDva
 fHDnpQk085vAxpQU4foVnM4ghv6JE5E=
X-Proofpoint-GUID: AN-rXp09P2koCaSSOM24XYnxXDk-nAlv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxOSBTYWx0ZWRfX9nFKyP7MdjqO
 npLRWeAOiNycfjibyRrNOxUAENDVge5RzUIUulyccJWhVGos4IMFpNBmQr50QqHUqxB4Ll+iLhz
 Qy3NF8dKaUwzHLITT5pMqdNnc4Lvyy5bl0e/NCZcPYVnFl0c0N4O0VkNs22RBsRLVAdv9gCsSFc
 ZZAEMJfMX7BasM7dHjoWh0eeo6vKSYZD5bMnmOJ7TtXUJUU+E6IbotFA9g/hyv/J40DvCMGv3S/
 qaXljrc7QjtWiyL7MzLS8Lrncav7Hcuxgn+g4oKYsqtbjhEHIA+76BLjoAJ7+YHuJ2sCXAPq5j3
 P1xxC0P7kJKtVpuksNgPFarCAYhWKB35W8Z8W6Wcgw9srvAbkORV6nPguaNlbZTXXGC32Pb+LTf
 itHahDRojDf0nfVfW1MDg2IM41erwK6Pz2eKGw3stG1nbfsLGpC5PodFtRNJS2Aj27LHVOKM4YN
 IoBDXYKWNa7w2UHKPng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_221052_987668_E69C9D34 
X-CRM114-Status: GOOD (  17.43  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/2026 4:13 PM, Vladimir Zapolskiy wrote:
> If MHI power up fails, for instance it happens due to a missing firmware,
> ath11k_mhi_start() returns without undoing mhi_prepare_for_power_up().
> Then the failed probe or power up unwinding frees the MHI controller,
> but the MHI device context and the RDDM image table allocated by
> mhi_prepare_for_power_up() are leaked along with their DMA buffers:
> 
>    % cat /sys/kernel/debug/kmemleak
>    unreferenced object 0xffff00079156a140 (size 64):
>      comm "(udev-worker)", pid 595, jiffies 4294893781
>      hex dump (first 32 bytes):
>        00 d0 f1 80 00 80 ff ff 00 50 f1 80 00 80 ff ff  .........P......
>        00 d0 f7 80 00 80 ff ff 00 30 fc ff 00 00 00 00  .........0......
>      backtrace (crc 62662f0a):
>        kmemleak_alloc+0x34/0x40
>        __kmalloc_cache_noprof+0x224/0x3b8
>        mhi_prepare_for_power_up+0x58/0x548 [mhi]
>        ath11k_mhi_start+0x30/0xb8 [ath11k_pci]
>        ath11k_pci_power_up+0xcc/0x188 [ath11k_pci]
>        ath11k_core_init+0x8c/0x190 [ath11k]
>        ath11k_pci_probe+0x4e0/0x870 [ath11k_pci]
>        local_pci_probe+0x40/0xa8
>        pci_call_probe+0x64/0x190
>        pci_device_probe+0xac/0x138
>        really_probe+0xbc/0x298
>        __driver_probe_device+0x16c/0x19c
>        driver_probe_device+0x3c/0x114
>        __driver_attach+0x98/0x19c
>        bus_for_each_dev+0x74/0xd0
>        driver_attach+0x24/0x30
>    unreferenced object 0xffff0007916fb800 (size 512):
>      comm "(udev-worker)", pid 595, jiffies 4294893781
>      hex dump (first 32 bytes):
>        00 60 04 81 00 80 ff ff 0a 00 00 00 00 00 00 00  .`..............
>        00 10 e0 82 00 80 ff ff 00 00 00 00 00 00 00 00  ................
>      backtrace (crc 52e9e075):
>        kmemleak_alloc+0x34/0x40
>        __kmalloc_noprof+0x280/0x440
>        mhi_alloc_bhie_table+0x54/0x168 [mhi]
>        mhi_prepare_for_power_up+0x318/0x548 [mhi]
>        ath11k_mhi_start+0x30/0xb8 [ath11k_pci]
>        ath11k_pci_power_up+0xcc/0x188 [ath11k_pci]
>        ath11k_core_init+0x8c/0x190 [ath11k]
>        ath11k_pci_probe+0x4e0/0x870 [ath11k_pci]
>        local_pci_probe+0x40/0xa8
>        pci_call_probe+0x64/0x190
>        pci_device_probe+0xac/0x138
>        really_probe+0xbc/0x298
>        __driver_probe_device+0x16c/0x19c
>        driver_probe_device+0x3c/0x114
>        __driver_attach+0x98/0x19c
>        bus_for_each_dev+0x74/0xd0
> 
> The MHI device is already powered down by mhi_sync_power_up() on
> failure, but mhi_unprepare_after_power_down() still has to be
> called on error path to release the allocated resources.
> 
> Fixes: 3df6d74aedfd ("ath11k: mhi: use mhi_sync_power_up()")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>   drivers/net/wireless/ath/ath11k/mhi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index a6c9ff112c68..76c194573ec7 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -446,6 +446,7 @@ int ath11k_mhi_start(struct ath11k_pci *ab_pci)
>   	ret = mhi_sync_power_up(ab_pci->mhi_ctrl);
>   	if (ret) {
>   		ath11k_warn(ab, "failed to power up mhi: %d", ret);
> +		mhi_unprepare_after_power_down(ab_pci->mhi_ctrl);
>   		return ret;
>   	}
>   

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

