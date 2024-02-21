Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3732EC48BEB
	for <ath11k@archiver.kernel.org>; Wed, 21 Feb 2024 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFKsWSMH1wT9/nviMB5tbVoBa26crR99WH6fhbTJAqc=; b=uQYG0mxZVEhtK25RgmRhpkIryL
	UmZxY9z2sM2urU5AfwxtKwL7vbi7XDF/nTAXLAPZ/j3qMcuPZ21ohA+2dNPmUhfIUqYb8mUo7J27w
	sbDSto/jdvR4C217EDYO4qA8Jy8wrY87y1GSpf08oyVkdI3csy42fzwitbp93fdgOOIRzEvAsYZaO
	umdg+xaxlrtoDCerpfPHz9ww4xustewsP4HANo9ic+d8hxmSNXkSsRT4aflVeqzxY4KqYlTHJLi3H
	XWOK0CnRm1AnuUe66PjvUUNQ1Vq5c3hIbM5L00FoCtAyZeQX8clwAE/ekV0jk7Vvww98TJLnc7VSV
	eyKeMBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqAv-00000001rnm-3Znw;
	Wed, 21 Feb 2024 17:14:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcqAs-00000001rm3-3HaH
	for ath11k@lists.infradead.org;
	Wed, 21 Feb 2024 17:14:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LCs4lM002699;
	Wed, 21 Feb 2024 17:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=JFKsWSMH1wT9/nviMB5tbVoBa26crR99WH6fhbTJAqc=; b=pH
	3GaQaruKUpqv9dobWlCKtd2xWtlsMsHD39yP67ldK1rxFDu/jLmGWkZnEkbzbhhM
	fIQg/JKHD78FL/Z9tIKoFDJdn4PAtVvI7IGgFkzZtIP2REyyxBZplh/FgZo1MA49
	rc44DDmxggibeQbb6ZTulAUdozwptKLXe9db0k0yNtvqUmECWoYLpKX2VLDPy7aF
	QrbP2mKwSbed1/A6DkTkfMMAkIRW38zF+SYegq1m3eAV4V9zAgCVCDPN+kmG5LdZ
	xeXW1DgyUd66Xd6YgYq/tqyCXIPGvZWAXnCBfURV9tLYUXxUMa32P4oIdrg+OSEl
	gNMfTC4yBsLzzlfdImJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd22s2mdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 17:14:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LHEO7a024672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 17:14:24 GMT
Received: from [10.110.34.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 09:14:23 -0800
Message-ID: <8160c395-939c-4d39-b9ee-0d0b780bb955@quicinc.com>
Date: Wed, 21 Feb 2024 09:14:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] wifi: ath11k: do not dump SRNG statistics during
 resume
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240221024725.10057-1-quic_bqiang@quicinc.com>
 <20240221024725.10057-4-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240221024725.10057-4-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0Xr-DsvXWXQAiNy-1R0Oz4Mdcn7K_3qI
X-Proofpoint-GUID: 0Xr-DsvXWXQAiNy-1R0Oz4Mdcn7K_3qI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_04,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=725 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_091427_005056_2359D768 
X-CRM114-Status: GOOD (  12.89  )
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

On 2/20/2024 6:47 PM, Baochen Qiang wrote:
> Both the firmware reset feature and the power management
> suspend/resume feature share common power-down and power-up
> functionality. One aspect of the power-up functionality is
> the handling of the ATH11K_QMI_EVENT_FW_INIT_DONE event.
> When this event is received, a call is made to
> ath11k_hal_dump_srng_stats(), with the purpose to collect
> information that may be useful in debugging the cause of a
> firmware reset.
> 
> Unfortunately, since this functionality is shared between
> both the firmware reset path and the power management
> resume path, the kernel log is flooded with messages during
> resume. Since these messages are not useful during resume,
> and in fact can be confusing and can increase the time it
> takes to resume, update the logic to only call
> ath11k_hal_dump_srng_stats() during firmware reset.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


