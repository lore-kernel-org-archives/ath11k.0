Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA79C369D9
	for <ath11k@archiver.kernel.org>; Thu, 24 Apr 2025 08:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OBlvphndicmOz5rOHCGOG3kl8emYmeybm4FDfDgmcYQ=; b=Uz/ztMSrdDpNjG5+RBF26Sr+NJ
	L83VWQy6H6x43o0euCyg7Xysc8midXouCtOWXDPwnPt3M0pYWKzB11k7FF8Qvtzdfkhr6Id3oDdn5
	Yxwe7ckqfiD1loXNGHFyr6yWvsJx14po8amnAeVcvVqD5RsDHKrWWS9+wHUi9e6sn/Y+Yy93qfM1G
	QsBz9D4L1p2MuSkfhkb8ALK8ujddhBZeJj5vD72Q/MbV7L1gNYJV4WWFhUQkfTrfTHXJmylrUH6xA
	QXjFyak29lkgsmy8Ord3CdV22U9jrdj4Zl1gJdPYFCOlH+eI2wveo/IRuCdlaSfDZIlkex5cyDUqz
	Q/TDsM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7s5D-0000000DLcy-1Bc7;
	Thu, 24 Apr 2025 08:37:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7quE-0000000D8au-1bfB
	for ath11k@lists.infradead.org;
	Thu, 24 Apr 2025 07:21:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FHIG000855;
	Thu, 24 Apr 2025 07:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OBlvphndicmOz5rOHCGOG3kl8emYmeybm4FDfDgmcYQ=; b=dfW6tsdPFZIstCYe
	qUJSCuOUCSZoUojygJS7LMwficLhpBUj42HEobKwOFwPqrLa7D82fZwqCDb+ayLb
	W/KMb4px5Ta3No2E4qdu7E/nM2pLL7A46TwRH7qbhDKh6G/1za+aX6MCFKyxPX8k
	TSCp8LTPa1YiXKNT32mmZTb/cVw32QlDVNNBTOrvYBd1WRk/7hhmtAnKyUmYOlFD
	/qdENAbjPz9ddCCKaUL4WNM3yEjKzaObeprwx/fXtr/Gz1k5cq6Myi7Ptso4UeVV
	yiGfc3L3r59tzCqiKEcTS3f8Wb5XO/ObjpG1XOGyxyzjA7k/O9iaVdnAYccaxLED
	EtB5Rg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3cjun-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 07:21:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O7LcX4028629
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 07:21:38 GMT
Received: from [10.216.33.96] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Apr
 2025 00:21:36 -0700
Message-ID: <fa16bad6-305f-77c1-3f56-703564e2dfee@quicinc.com>
Date: Thu, 24 Apr 2025 12:51:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath11k: pci: Fix msi_irq crash on driver unload
 with QCN9074 PCIe WiFi 6 modules
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <balsam.chihi@moment.tech>,
        <jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>
References: <20250416100939.282481-1-balsam.chihi@moment.tech>
 <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <0e129e2a-67fc-48cc-9773-efbea3f7391d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA0NyBTYWx0ZWRfXxAKA5NrVIvp2 jH2uFArkwgXQD2EIMAVXtyftSfBEwlQGa5ZKEkhTnu01ZwggHaHPQwPzGQSI42hI5qvvmyhAto6 gjzEcQwA459ZRW7imx087R7rzPnom1qGkH41umtTXEOPOtJfbkrK/f3/HTE6ywcuLswijgbOLX3
 BwppRDZMfRtc6pQ/9VEFlQFTfd0FmENHDVXhflLsl93QZkmNgleGW1PmbyWFqSwV7USELfo2DAD 3fzxdLdOK9AUPSgahYOpJLW//1CgPvse4DvrF1EWYum1fRRUZSrMEuwx232+4MAKJZ/67oNO0GD iKhC0kBci3l2Llcbqe31cO7u/AZREKhmxiRq7CtnXvYR9rufw4cYprlPrRGuOeobIVGcJLuqI5C
 tT+PBLB4JeHjIkNOBpU0PWPhTDzq4LKanlvAgiuzR8tkJFp/xqTKSE6UJEd75i8fsEJdiKEu
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6809e683 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=33T7mwWb2eJha9v3rUkA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 3cQFmdBGd5XJCyGGfahPsdOSCDUXBBW9
X-Proofpoint-GUID: 3cQFmdBGd5XJCyGGfahPsdOSCDUXBBW9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_03,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_002158_452714_CB5FA780 
X-CRM114-Status: GOOD (  16.11  )
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



On 4/24/2025 11:21 AM, Baochen Qiang wrote:
> 
> 
> On 4/16/2025 6:09 PM, balsam.chihi@moment.tech wrote:
>> From: Balsam CHIHI <balsam.chihi@moment.tech>
>>
>> This patch addresses a crash issue that occurs when unloading the
>> ath11k_pci driver with QCN9074 PCIe WiFi 6 modules.
>> The crash is caused by the driver attempting to perform reset
>> operations during unload, leading to a synchronous external abort
> 
> Do we know the root cause of the synchronous external abort?
> 
>> and kernel panic, as indicated by the error log:
>>
>> [ 5615.902985] Internal error: synchronous external abort: 0000000096000210 [#1] SMP
>> ...
>> [ 5616.056382] CPU: 7 PID: 12605 Comm: procd Tainted: G O 6.6.73 #0
>> ...
>> [ 5616.069876] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [ 5616.076841] pc : ath11k_pci_get_msi_irq+0x18b4/0x1914 [ath11k_pci]
>> [ 5616.083035] lr : ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
>> [ 5616.163712] Call trace:
>> [ 5616.166153] ath11k_pci_get_msi_irq+0x18b4/0x1914 [ath11k_pci]
>> [ 5616.171993] ath11k_pcic_init_msi_config+0x98/0xc4 [ath11k]
>> [ 5616.177583] ath11k_pcic_read32+0x30/0xb4 [ath11k]
>> [ 5616.182391] ath11k_pci_get_msi_irq+0x528/0x1914 [ath11k_pci]
>> [ 5616.188143] ath11k_pci_get_msi_irq+0x147c/0x1914 [ath11k_pci]
>> [ 5616.193983] ath11k_pci_get_msi_irq+0x1764/0x1914 [ath11k_pci]
>> [ 5616.199822] pci_device_shutdown+0x34/0x44
>> [ 5616.203923] device_shutdown+0x160/0x268
>> [ 5616.207847] kernel_restart+0x40/0xc0
>> [ 5616.211512] __do_sys_reboot+0x104/0x23c
>> [ 5616.215436] __arm64_sys_reboot+0x24/0x30
>> [ 5616.219447] do_el0_svc+0x6c/0xfc
>> [ 5616.222761] el0_svc+0x28/0x9c
>> [ 5616.225817] el0t_64_sync_handler+0x120/0x12c
>> [ 5616.230174] el0t_64_sy
>> [ 5616.233839] Code: f94e0a80 92404a73 91420273 8b130013 (b9400273)
>> [ 5616.239932] ---[ end trace 0000000000000000 ]---
>> [ 5616.244547] Kernel panic - not syncing: synchronous external abort: Fatal exception in interrupt
>> [ 5616.253343] Kernel Offset: disabled
>> [ 5616.256827] CPU features: 0x0,00000000,00020000,1000400b
>> [ 5616.262138] Memory Limit: none
>> [ 5616.265188] Rebooting in 3 seconds..
>> [ 5620.268926] Unable to restart system
>> [ 5620.272503] Reboot failed -- System halted
>>
>> The fix involves adding a conditional check for the power state before
>> performing the reset operations in the ath11k_pci_sw_reset function.
>> This ensures that the reset functions are only called when loading the driver,
> 
> The ath11k_pci_soc_global_reset() is called to make sure the device is in the expected
> state, such that after machine restart, the device can be successfully enumerated. If
> skipped, the chip may be not detected. At least this is the case for WCN6855, for others I
> am not sure.

It is not safe to skip soc_global_reset for QCN9074 also as this may leave target
in an unknown state. Better to get the actual register access that is causing
the error, also we check check ath11k debug log with debug_mask=0x1020 enabling
boot and ath_pci debugs.

Vasanth


