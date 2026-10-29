Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF32E606A31A
	for <ath11k@archiver.kernel.org>; Thu, 29 Oct 2026 05:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RSMaLa4m;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kAu0H6dv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b8F9LIX9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7TJq6ezoddiw0WtE00XQmq7Nc4tiEz7eeOE29EDeZng=; b=RSMaLa4mKqwjL7
	UcQ+4B7s695Rj6FWeXxR8HZA4+x9H6UJo9vPsHPmNydJ9/n7CIcrHDov256m/t9DYvRQnHK1fSXBe
	JsCR25nOFeDc34y+EdIgxeJQW/5i/CiU7l860PG7a8itfAItFbq2mLAGS88hpHV91TWVghY9wpjdL
	mU8qR6NBD1Cn9viPWr3ZKBPiHz0cmsWetm7KJ7VQku3u8dj7NUVCnqawoM7c0M4NPiPVoM+f5goO2
	vgM6yS8nDAlBt+PRcfWXFhdlZ6281ZyrChRzdX5qNUvXNZdncDIOlNefDV1fa+/N9k3TbfslBPSFX
	Lc4ICQa+aTvNXLIR1cLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIqn-00000008P7C-1rFs;
	Thu, 29 Oct 2026 05:38:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIqk-00000008P6f-3glG
	for ath11k@lists.infradead.org;
	Thu, 29 Oct 2026 05:38:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HEbA3889699
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 05:38:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7TJq6ezoddiw0WtE00XQmq7Nc4tiEz7eeOE29EDeZng=; b=kAu0H6dv4D0+AO6t
	/ZAb64NIm7yOs4UHvtuOOEZOlHnUCnYuJaU/cD8/FC6n3Su5nDlPDUzrPBUNGExb
	qZLduFlS1e/KSm6LNZByIeFVj7lHJs+zyFQ8bGF5G30/T8oBInVPWMsf0n+xgS7P
	DAXQXY1Ma6SB4ROD3i/37ZYNvJbY1MMF1nbjvbll2nWYKKe8aHf+Cujxabmfof37
	r0Yo/5ECD3fVLypRw6srrE2LfTgx8rme1S8A6jUVmQDjJYyTsP3sbcCPwcp1e5i5
	3tP5gFUncomOx7OX0/shgrzf1o4bzEUulAjpB63BiV1k/873/Rjln2NxRPXya6Dy
	YsMqJg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2181-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 29 Oct 2026 05:38:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso1911481a12.2
        for <ath11k@lists.infradead.org>; Wed, 28 Oct 2026 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793252332; x=1793857132; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7TJq6ezoddiw0WtE00XQmq7Nc4tiEz7eeOE29EDeZng=;
        b=b8F9LIX9J+r4RADG7SdMOHpvd+rqQ/xCRwF2NvfQUBrUkhjh6OoMgw+ZHTGWeMECo5
         sZNM4IZJ8AFvMpEP4qenL/r2HESHS2wT3rHF628WWl2K+QuyInbS/sGeDEAytYF3cJZq
         h+CfPMO/SROttz0PRHlmRYFnoYr2BsGj0SQFiuQOYJStytYj72n1RtWpfQprT/cY9F5S
         +Ek2MUCL0yjNlai5KHLgXI+Wi2kUM1u9Lue8pSvconrwKqREdDKSYRuC3oZOT0Uva/Qd
         HDOFqIepMmFVJcvzrW+ovicuvAvq9f046TB8R5YfMHcReWXL96t2uRMhS1+Ji1EkgwFX
         bEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252332; x=1793857132;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7TJq6ezoddiw0WtE00XQmq7Nc4tiEz7eeOE29EDeZng=;
        b=V+g9kJMPOcKDhApuN5Glxt1oyqhz2auqN4msdK6r7xzC1FU4EwngZ0z+dJV6l4obQi
         DvWhRwE+UBoJNpK6stpFUYcgtVI44Qgd70ItQfHdmUCgWUcgWacnPSCPJgUe3xc5Zwup
         kFWtHvDo62m5c1tNJcEej4aW0K3Tzah5QSNg/1g2+kwnOi4FrXlGN1QlUF9IahZzDjEp
         vBJxAO07cp7gNJyFN14M0E1DOqphFsnJBh0CTv8toDA6DZ99KNJNJdcphN9N3x9pC5qs
         J+3NpyI5Nqm7gzBCcCTYNcqOf50D2ERLhMar/37CH1vNEnscWzuOSNFyoW2/lJHswlX+
         IxtQ==
X-Forwarded-Encrypted: i=1; AKwUvBySZQkIN/PDl0SR7UyVfCFUW4nftbvj+xgEMMXotBnUitryvxqEPdxVMkBgdNGMC1N/9mJ6mB8=@lists.infradead.org
X-Gm-Message-State: AFq9FYLOVYvlBerr81mIjcibTFCnYUt3VVeRdulXUTrSx7H7L4gIImte
	ZCsHbI7CnY/9ePs0u0IpTotErJXVNJbYv83Omz01tpbqn8mvUQJVQkQetpjomVX7ZoVnq7P+E5T
	F3cJfhnn9zTURUllf8IvLOvDehveCkdByo/gXLxnQWO+S8K0Xnr2P2PwnsI2lY6jM
X-Gm-Gg: AYBFou3qhuluJwtTlsfPiiVB2vmV9rgoUr5tNVA4pypceS9n4U1Hazp7ZiMeOAgruU3
	drjLqEkSNJWznDCGQeQXO6aHnu0U3gzF9aPv1fLLHtIlCU3Ndpl0oEEEsRbrSXxq42xIZKtAiHK
	jfOrBuAbmPXAWbrlKzTmpQSVfSrLQDF8eercDhhX3o14nGYZUQJFaR8ZZxoQpte1hujU1LTy0e2
	Jz7unr0Lea78rlwqulAiYRlT7rEQF78A7KU6ZVBsl8BaBPrVL2/vsYNFeADKhhtKkkd2JSpirCX
	91ZMsFbOMqSt8s8lnyDl1ZtIyU5INczHAlijwADWVYHtb671ewKUsyyU1ut04+BST6i4MwFllFe
	2EdK+UR63HUZCbbnSbdu4cB/3iO/Ua4A6owop5uCOZaZQrK7XWNi70X/IgndupyPjHJ26Idv/9N
	cyXMDbCAAFLEwuxURKsiwAga5CrlI31Upbzm7Iga1jmDGF
X-Received: by 2002:a17:902:da8a:b0:2e6:1715:e48d with SMTP id d9443c01a7336-2eb0040ad44mr43199885ad.35.1793252332299;
        Wed, 28 Oct 2026 22:38:52 -0700 (PDT)
X-Received: by 2002:a17:902:da8a:b0:2e6:1715:e48d with SMTP id d9443c01a7336-2eb0040ad44mr43199715ad.35.1793252331745;
        Wed, 28 Oct 2026 22:38:51 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6455a00sm28716615ad.2.2026.10.28.22.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 22:38:51 -0700 (PDT)
Message-ID: <e67e9442-03d3-425f-85d9-0983a16ae5f7@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 13:38:48 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: Unprepare MHI on power up failure
To: Vladimir Zapolskiy <vz@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20261028104336.1686334-1-vz@kernel.org>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028104336.1686334-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae2dbed cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=CJITIh9EL64xvWp9jcUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: UZRF3VqzhgOFbuDYmVAiYQfaCdGtCmox
X-Proofpoint-ORIG-GUID: UZRF3VqzhgOFbuDYmVAiYQfaCdGtCmox
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX0mwvYnqJu2iA
 ykUib1PdZBGrGpvWXY207RoCigGm7iG88rfU6AUf9IXKuDEw0/yR2k2zy/91csCmY0xJPMu1qso
 urHk7rorFv0xvr0OF01P1SUeqR3I9V9N2s6D1vxdUSyy8XjKqU13FGml6QcAL1XCm4Fqsz+tnnr
 seihR8vf/3xYG7GYbM/IYIBHJ4pPM4eQbXdSdLIiHyeS3M+4XPWYeNyNky75zW/UtlZ5Kf4IsLJ
 /TC14lKF9xRO084dchzwkv9GOVX2VTPVLTeL64d9M9jACnibr+Y/D8E6gx3zXOv8BvLafrem3zV
 V9JiZVuXXFKZdysaqc5zfMLwO5CJVREQaj3Zr6/HfbomJVug/ywTVV6OLBNijap64W7PkPh24w3
 xm3VXMsBSrCO9o+IFhyvw03R1TEQmFY0Svcpl7TcN/iP4yoStvUBPEmIN2JdFr3DQwrhTfg8bVc
 pkXj8T4i8RXWbcF2djQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyMSBTYWx0ZWRfX9cAHjsYWWuCH
 S7w/xP8dYEs31VMYr2hbYBtxFW96gxFOWL2oLrmwAiCCLkYrjkFAWaSCNzyiP6qdAV7QdJlZdS+
 yWsIcH+ZHQpCASph9D0qeRKbZ1FUNW4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_223855_039835_AEE360EF 
X-CRM114-Status: GOOD (  22.70  )
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



On 10/28/2026 6:43 PM, Vladimir Zapolskiy wrote:
> If MHI power up fails, for instance it happens due to a missing firmware,
> ath11k_mhi_start() returns without undoing mhi_prepare_for_power_up().
> Then the failed probe or power up unwinding frees the MHI controller,
> but the MHI device context and the RDDM image table allocated by
> mhi_prepare_for_power_up() are leaked along with their DMA buffers:
> 
>   % cat /sys/kernel/debug/kmemleak
>   unreferenced object 0xffff00079156a140 (size 64):
>     comm "(udev-worker)", pid 595, jiffies 4294893781
>     hex dump (first 32 bytes):
>       00 d0 f1 80 00 80 ff ff 00 50 f1 80 00 80 ff ff  .........P......
>       00 d0 f7 80 00 80 ff ff 00 30 fc ff 00 00 00 00  .........0......
>     backtrace (crc 62662f0a):
>       kmemleak_alloc+0x34/0x40
>       __kmalloc_cache_noprof+0x224/0x3b8
>       mhi_prepare_for_power_up+0x58/0x548 [mhi]
>       ath11k_mhi_start+0x30/0xb8 [ath11k_pci]
>       ath11k_pci_power_up+0xcc/0x188 [ath11k_pci]
>       ath11k_core_init+0x8c/0x190 [ath11k]
>       ath11k_pci_probe+0x4e0/0x870 [ath11k_pci]
>       local_pci_probe+0x40/0xa8
>       pci_call_probe+0x64/0x190
>       pci_device_probe+0xac/0x138
>       really_probe+0xbc/0x298
>       __driver_probe_device+0x16c/0x19c
>       driver_probe_device+0x3c/0x114
>       __driver_attach+0x98/0x19c
>       bus_for_each_dev+0x74/0xd0
>       driver_attach+0x24/0x30
>   unreferenced object 0xffff0007916fb800 (size 512):
>     comm "(udev-worker)", pid 595, jiffies 4294893781
>     hex dump (first 32 bytes):
>       00 60 04 81 00 80 ff ff 0a 00 00 00 00 00 00 00  .`..............
>       00 10 e0 82 00 80 ff ff 00 00 00 00 00 00 00 00  ................
>     backtrace (crc 52e9e075):
>       kmemleak_alloc+0x34/0x40
>       __kmalloc_noprof+0x280/0x440
>       mhi_alloc_bhie_table+0x54/0x168 [mhi]
>       mhi_prepare_for_power_up+0x318/0x548 [mhi]
>       ath11k_mhi_start+0x30/0xb8 [ath11k_pci]
>       ath11k_pci_power_up+0xcc/0x188 [ath11k_pci]
>       ath11k_core_init+0x8c/0x190 [ath11k]
>       ath11k_pci_probe+0x4e0/0x870 [ath11k_pci]
>       local_pci_probe+0x40/0xa8
>       pci_call_probe+0x64/0x190
>       pci_device_probe+0xac/0x138
>       really_probe+0xbc/0x298
>       __driver_probe_device+0x16c/0x19c
>       driver_probe_device+0x3c/0x114
>       __driver_attach+0x98/0x19c
>       bus_for_each_dev+0x74/0xd0
> 
> The MHI device is already powered down by mhi_sync_power_up() on
> failure, but mhi_unprepare_after_power_down() still has to be
> called on error path to release the allocated resources.
> 
> Fixes: 3df6d74aedfd ("ath11k: mhi: use mhi_sync_power_up()")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  drivers/net/wireless/ath/ath11k/mhi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index a6c9ff112c68..76c194573ec7 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -446,6 +446,7 @@ int ath11k_mhi_start(struct ath11k_pci *ab_pci)
>  	ret = mhi_sync_power_up(ab_pci->mhi_ctrl);
>  	if (ret) {
>  		ath11k_warn(ab, "failed to power up mhi: %d", ret);
> +		mhi_unprepare_after_power_down(ab_pci->mhi_ctrl);

For the probe path itself this is fine: when probe fails the driver is not bound, so no
remove or shutdown follows and this is the only unprepare.

The problem is that in runtime, ath11k_hif_power_up() is also called from reset and resume:

reset:
	ath11k_core_reset() {
		...
		ath11k_hif_power_up()
	}

resume:
	ath11k_core_resume_early() {
		...
		ath11k_hif_power_up()
	}

The later teardown in rmmod path or shutdown path then calls power_down unconditionally,
regardless of whether the last power_up succeeded:

rmmod:
  mhi_unprepare_after_power_down()   <- 2nd call
  ath11k_mhi_stop()
  ath11k_pci_power_down()
  ath11k_hif_power_down()
  ath11k_core_deinit()
  ath11k_pci_remove()

shutdown:
  mhi_unprepare_after_power_down()   <- 2nd call
  ath11k_mhi_stop()
  ath11k_pci_power_down()
  ath11k_pci_shutdown()

so the unprepare is called twice, while in the second call we can hit NULL pointer
dereference or double free ...

This comes from the fact the existing code does not handle power up failure correctly in
reset and resume. I don't see a proper solution to this, maybe we need a new flag telling
us whether the unprepare has been done already ?

