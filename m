Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ACEC3DA7F
	for <ath11k@archiver.kernel.org>; Mon, 12 Aug 2024 19:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hzaPWQwxCqQP16WI8joKzRnT3Lpc8ce20Tdr9ekV4g=; b=qojKulGSz4GoC/qJ9dBoMEtYDe
	pXn5D3Yap8GcZVkRvKuv+ApGSLaAI/F3QZMiBhRX+enhBk/StkXWA8SB5ftw+53ENYhzCZ9I2Chv+
	jKS/fHhTuOGKnM8xlgMr4QxkC0CM4V1VK6xvLlmefz/N6KWP0hVzIODJx9rRc8Ord9jkdpS+kPCsH
	Xt89VZj38x9IdN8Wc+PXKr0fepEfWbi6n2/m1x0BJZtuh5TMgZa6ve8PhOd4/brrwQ9Uww97fFzt0
	re8jq5TJ0xL8g6aXedeklPOuYxk6S3x5C3qRJV2uWFJOUNLrTDRR9Ir2KVOIcgZf4bRTqwZfJfuqg
	JR6iNirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdaUV-00000001J2g-0h4j;
	Mon, 12 Aug 2024 19:14:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdaUR-00000001J2E-3h1K
	for ath11k@lists.infradead.org;
	Mon, 12 Aug 2024 19:14:01 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSUMP021408;
	Mon, 12 Aug 2024 19:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hzaPWQwxCqQP16WI8joKzRnT3Lpc8ce20Tdr9ekV4g=; b=kgTnvvAGc6xPPZLW
	9P6ILpkoIGR7b4RzTnNMjLk2yhR1XBrQqQeTuDJNRIcSXWWHS3rYdPf3mnK3CfTO
	4WMLaR50PQjTOzCAfetV/RnUhkSRoBPHdpRNi+Pj34iI58vgdHi4pYfrBEMvPzJz
	BP2gEC1Pb1a0K+BGuuZRyG4ifEn+Xtbrmj95zW1Jdc8XpNmVqMS9ob77EdYEN7d1
	E5mHySCdvJrASy12vABfQsfuyps4a/xjxLEo1mSmvtlh9WGjTh5k0/Knac8ZBUHI
	hHpBivflxp0xDrAfaZBWvqEChdy9SUxPZtd70qlXL+AnYomAIeqaL3xyMrqskUQN
	b77w7w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1g7w8vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 19:13:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CJDvX4016618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 19:13:57 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 Aug
 2024 12:13:56 -0700
Message-ID: <1ac890d9-7efc-4eda-ac5d-c03483b3c2ef@quicinc.com>
Date: Mon, 12 Aug 2024 12:13:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] wifi: ath11k: use union for vaddr and iaddr in
 target_mem_chunk
To: Miaoqing Pan <quic_miaoqing@quicinc.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240731014104.798028-1-quic_miaoqing@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240731014104.798028-1-quic_miaoqing@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6OHqUqm7SHm5eibcu6Uzr4V_X31HulKs
X-Proofpoint-ORIG-GUID: 6OHqUqm7SHm5eibcu6Uzr4V_X31HulKs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_12,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=720 mlxscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_121359_958903_877D3FB6 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

On 7/30/2024 6:41 PM, Miaoqing Pan wrote:
> The value of 'ab->hw_params.fixed_mem_region' determines that
> only one variable 'vaddr' or 'iaddr' is used in target_mem_chunk.
> So use an anonymous union instead, easy to check whether the
> memory is set or not.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



