Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4614C4167B
	for <ath11k@archiver.kernel.org>; Tue, 28 Nov 2023 01:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCS7zyxu9RdWvhsJ3hKWPHiiextYJ5r8KiC7X+AF/ow=; b=KnA3UV7P0jTalE
	As91zEDEc5D7/A3k615mkVtMwFBjfBgCmd8Ga+6B/RQ9LpdIXZWgtt/cA/UrYHgoz4S1IIpHXw/LL
	TY05h6ujQfgPlTHjy+sf0nMcu3zpIga3S2U9hVDeodZgypwC8n4ciO9nCcRHTCBTRNiUW5SR1ztHF
	D9nj3IulQO4IxnjNgdljfzPso/gAlkhk8Mn/mrG5Vz68B64XzEib05PS5wFdd40WxLJeYLrPDKrC/
	u0ja/cEWXIlc5tItwq/crZOjnRw7+k9RXeICxgZbd1peUXZ0Fm+jEowHA9JSWVaoN+OBUyZ3DmqGN
	w8ZARQyxdkx0JtiUeCPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7mfT-003niC-11;
	Tue, 28 Nov 2023 01:13:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7mfQ-003nhF-1T
	for ath11k@lists.infradead.org;
	Tue, 28 Nov 2023 01:13:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS0jLb4032114;
	Tue, 28 Nov 2023 01:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zmXrVDwk9PW2eTGFIyou52WJVtdPQELuoB2+agP0haY=;
 b=p2Mhgd8UlvC/oLcF3QDMRQnMuit71WSJXSteG2qxd+z5l7u25Zyuhb5Eon0XNncP7XR6
 vqg4RwIoztPdCl8NTNPtVMIpaPQSUkqy1OHrZJulYHUJi/M/wt4ldytFgCTqhnvntQRL
 c8GANT01L+VoTKqBez5QHzY0Rb5sz5HYH1DIfz7ikYrSmAkhuywhr2hpfMYrzUH1NYRx
 qX57YGYxyQTtrclf+Nhd3eKIC6ABbevYHeEXz6yDhVq4Qkpsg8krM++nUQPjEzFCVn9J
 9u8zudJ7+WAnUTOWjQ07cG4K9jFFZvob+mFChhQnKZuNrr3eULQZ7ZyYZ+s46QBDye7n jw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umt9c1y00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 01:13:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS1DUcS002839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 01:13:30 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 17:13:29 -0800
Message-ID: <7b833b76-13d2-4672-8f70-5ec681648c28@quicinc.com>
Date: Tue, 28 Nov 2023 09:13:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/8] wifi: ath11k: remove MHI LOOPBACK channels
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <mhi@lists.linux.dev>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20231127162022.518834-1-kvalo@kernel.org>
 <20231127162022.518834-5-kvalo@kernel.org>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20231127162022.518834-5-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PnEjgTK82t8yS0PAczJNIMkXt5uuzWhE
X-Proofpoint-ORIG-GUID: PnEjgTK82t8yS0PAczJNIMkXt5uuzWhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_01,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=928
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311280007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_171336_628162_F3CB406D 
X-CRM114-Status: GOOD (  18.86  )
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



On 11/28/2023 12:20 AM, Kalle Valo wrote:
> From: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> There is no driver to match these two channels, so
> remove them. This fixes warnings from MHI subsystem during suspend:
> 
> mhi mhi0_LOOPBACK: 1: Failed to reset channel, still resetting
> mhi mhi0_LOOPBACK: 0: Failed to reset channel, still resetting
With v2, these warnings are gone even without this patch. so it should 
be removed from commit log. It's enough to only mention that those 
channels are not used.

> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath11k/mhi.c | 56 ---------------------------
>   1 file changed, 56 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index afeabd6ecc67..579af57f7377 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -21,34 +21,6 @@
>   #define RDDM_DUMP_SIZE	0x420000
>   
>   static struct mhi_channel_config ath11k_mhi_channels_qca6390[] = {
> -	{
> -		.num = 0,
> -		.name = "LOOPBACK",
> -		.num_elements = 32,
> -		.event_ring = 0,
> -		.dir = DMA_TO_DEVICE,
> -		.ee_mask = 0x4,
> -		.pollcfg = 0,
> -		.doorbell = MHI_DB_BRST_DISABLE,
> -		.lpm_notify = false,
> -		.offload_channel = false,
> -		.doorbell_mode_switch = false,
> -		.auto_queue = false,
> -	},
> -	{
> -		.num = 1,
> -		.name = "LOOPBACK",
> -		.num_elements = 32,
> -		.event_ring = 0,
> -		.dir = DMA_FROM_DEVICE,
> -		.ee_mask = 0x4,
> -		.pollcfg = 0,
> -		.doorbell = MHI_DB_BRST_DISABLE,
> -		.lpm_notify = false,
> -		.offload_channel = false,
> -		.doorbell_mode_switch = false,
> -		.auto_queue = false,
> -	},
>   	{
>   		.num = 20,
>   		.name = "IPCR",
> @@ -114,34 +86,6 @@ static struct mhi_controller_config ath11k_mhi_config_qca6390 = {
>   };
>   
>   static struct mhi_channel_config ath11k_mhi_channels_qcn9074[] = {
> -	{
> -		.num = 0,
> -		.name = "LOOPBACK",
> -		.num_elements = 32,
> -		.event_ring = 1,
> -		.dir = DMA_TO_DEVICE,
> -		.ee_mask = 0x14,
> -		.pollcfg = 0,
> -		.doorbell = MHI_DB_BRST_DISABLE,
> -		.lpm_notify = false,
> -		.offload_channel = false,
> -		.doorbell_mode_switch = false,
> -		.auto_queue = false,
> -	},
> -	{
> -		.num = 1,
> -		.name = "LOOPBACK",
> -		.num_elements = 32,
> -		.event_ring = 1,
> -		.dir = DMA_FROM_DEVICE,
> -		.ee_mask = 0x14,
> -		.pollcfg = 0,
> -		.doorbell = MHI_DB_BRST_DISABLE,
> -		.lpm_notify = false,
> -		.offload_channel = false,
> -		.doorbell_mode_switch = false,
> -		.auto_queue = false,
> -	},
>   	{
>   		.num = 20,
>   		.name = "IPCR",

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
