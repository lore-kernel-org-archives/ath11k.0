Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44F8C47DDB
	for <ath11k@archiver.kernel.org>; Fri, 26 Jan 2024 17:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdSQHsJ3t+MiU0FH+ji6aHzNmBTJjrA4QMAmImMSrt4=; b=RsUE2CTdmvlwg/TVNHcwWXfASE
	zwCgZCMbVXUurcZksEOBmjsMiyatGtRJVVmi18wWdzqWGnf/Ke+l4lYpnxRY9ESozl4gB+65o3umF
	jG95hBbrt6Xt6dMki++pubi9PPxPmNc1qskVFmKnbnM9Imj7snr+o8B4z0h2jYZVZXrsyP3fg8LJe
	D3DRSOqqD1PbO/ufiIQyuIfXuG47vcMORw76NdRxzsvyYiQrLHGvdcQgxURuHQiJhL1IE/8EjZVY+
	paw5nwxxS6CgNl5f9n21vf5AgVNYyBFhGvIqaoOZr26D3qhq3OJBNobflmawg9WKGlF88zaoo/2eP
	Sf6Jf4aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTPe4-00000004nMi-1KOi;
	Fri, 26 Jan 2024 17:05:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTPe1-00000004nLG-0tJ8
	for ath11k@lists.infradead.org;
	Fri, 26 Jan 2024 17:05:34 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QFcBVJ024782;
	Fri, 26 Jan 2024 17:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=RdSQHsJ3t+MiU0FH+ji6aHzNmBTJjrA4QMAmImMSrt4=; b=I5
	aaFhk5fKxO+TRBSRcEagEkcLrlOjcmaHPbn0Z7WvntBS5WT2x6ydoidz/MMQbO/o
	29Sp7+3jgH+r6R2ZGuHHUi+m+eDt5ZEDs57a6hbi9a7Vq65roSBe6PtPjMuQPG+R
	HzLtOpxO1drIe6EE/FTkz6F4oGFRHW5GazBNGwJKibLooFueAfJQPeTseREND+1Y
	R+jLnqanbnk30pa091l+AEIHx8OhAfOqeaVO3/4hy997e+tXaqsDT7KhGF0s2OMp
	zG0TiIgkyvJvelsRSTk2XGbxwLowUuuURwQQlNiswm4tgQoVrmcHdDcBRsRHyvC3
	TGTWLoGoaRbtItotkshg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vuypkj7rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 17:05:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QH5SZi022328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 17:05:28 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 09:05:27 -0800
Message-ID: <9c321dfc-f10d-4092-a1cd-30952e4da695@quicinc.com>
Date: Fri, 26 Jan 2024 09:05:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: document HAL_RX_BUF_RBM_SW4_BM
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20240111-document-hal_rx_buf_rbm_sw4_bm-v1-1-ad277e8ab3cc@quicinc.com>
 <874jfg7xm4.fsf@kernel.org>
 <b4f29511-e001-4964-b88d-208dabf88121@quicinc.com>
 <875xzq526o.fsf@kernel.org>
 <fc6ca019-83e9-4571-bfce-2b4e5c233aef@quicinc.com>
 <87ttn0xc9y.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87ttn0xc9y.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gkv8LedZGgzdaSeIP6bj1Fbt-7xPr8kz
X-Proofpoint-GUID: gkv8LedZGgzdaSeIP6bj1Fbt-7xPr8kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 mlxlogscore=641 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_090533_412035_1F2A2D8A 
X-CRM114-Status: GOOD (  10.24  )
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

On 1/26/2024 8:58 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> They have the same problem I'm trying to fix ;)
>> % scripts/kernel-doc -Werror -none \
>> 	$(find drivers/net/wireless/intel/iwlwifi -name '*.[ch]')
>> ...
>> 322 warnings as Errors
>> %
> 
> Ouch. But I'm surprised why nobody has reported these before? Are the
> kernel-doc warnings ignored by everyone?

There are folks who use the kernel 'make' command to build the
documentation, and report issues from that. But my understanding is that
'make' only processes the source files that are referenced by the
kernel's .rst files. So if a source file has documentation, but that
source file is not included by one of the .rst files, it won't normally
be processed.

It is only by running kernel-doc directly against the sources that you
can spot these issues.

/jeff

