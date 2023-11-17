Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBC6C197A0
	for <ath11k@archiver.kernel.org>; Fri, 17 Nov 2023 01:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gaDEV2SLDKYouz0eYiW/W0JV3VmuX5fARcbznWS9G9k=; b=KdchWbK3+sL2tI
	STKuae07RMj3l3dJR/QpOp1PjS6JGXV+EzzRvGwYF+d4Ylka25VALm/7lmdBrcmbSwH/m7oumj59H
	g7xNz2XNDYsR4clkAplW7333xXZ/IlUJLGL9Ot+vVRKEoNzGBn8i7cPg5bID11BWY9vWs2pSRXtHJ
	dQFuyqa+uARXJvd4lxsn1ebjqipdu0rnhnckeG08biLFWFpBPqJq2vIsulE54n+6NFk22/e76GuHS
	RuDi9Itg0M1WcNT/pA6rlpDpYMmtrtDY6Ki2Pd8CDy5q7MlF7lxDkfoeDQIvmrBDejakSu1bva1ty
	v0GXGo83FYXY7kml2OQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3nhM-005PNE-0I;
	Fri, 17 Nov 2023 01:31:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3nhF-005PMc-28
	for ath11k@lists.infradead.org;
	Fri, 17 Nov 2023 01:31:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH0GV70000409;
	Fri, 17 Nov 2023 01:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=sqg4Xz/17GfEmjamOFsQf5DpoV5qumNYXp9eABsg9/Y=;
 b=Lcywg6F1sgd9l3IZGGw9j+HJ2R9KtO/BMkEjpAFJtXNx+2CbFOjqiNSdhczlZqWB6dlI
 +GJsJuqjlP13A3ueCh9CdI0wezHJkuKgK5mr9C5ibW6bldrpkBOEGF15j8RJdlucFBei
 7r7MKbXgSuSGzuOcaZsR23l6IynXminVtedb922ADILLw/Tuh9Az0TU1AS6Y7JgMzN+m
 WQrKSJEGmTwL9vPX+VLCeyZPsth0RUEN2rahPVzyMcZyIKg1qTND9GIdxtNUfkWl51vW
 4RssLxEcpRMPkRJBB5pcAmce7aex/hE7Iwk0BUASu0XVrFQnXciCwdJ6wV7AbJpUqGQx Fg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udkqa1kbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 01:31:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AH1V0Zd026130
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 01:31:00 GMT
Received: from [10.110.1.143] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 16 Nov
 2023 17:30:59 -0800
Message-ID: <911a18d7-3c2c-4c9c-b309-6e0879ed7867@quicinc.com>
Date: Thu, 16 Nov 2023 17:30:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix race due to setting
 ATH11K_FLAG_EXT_IRQ_ENABLED too early
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231117003919.26218-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231117003919.26218-1-quic_bqiang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uJOU8_SZRIorsq4hpjR191A23BL36rTZ
X-Proofpoint-GUID: uJOU8_SZRIorsq4hpjR191A23BL36rTZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=738
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_173101_711030_5D7EA5C6 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/16/2023 4:39 PM, Baochen Qiang wrote:
> We are seeing below error randomly in the case where only
> one MSI vector is configured:
> 
> kernel: ath11k_pci 0000:03:00.0: wmi command 16387 timeout
> 
> The reason is, currently, in ath11k_pcic_ext_irq_enable(),
> ATH11K_FLAG_EXT_IRQ_ENABLED is set before NAPI is enabled.
> This results in a race condition: after
> ATH11K_FLAG_EXT_IRQ_ENABLED is set but before NAPI enabled,
> CE interrupt breaks in. Since IRQ is shared by CE and data
> path, ath11k_pcic_ext_interrupt_handler() is also called
> where we call disable_irq_nosync() to disable IRQ. Then
> napi_schedule() is called but it does nothing because NAPI
> is not enabled at that time, meaning
> ath11k_pcic_ext_grp_napi_poll() will never run, so we have
> no chance to call enable_irq() to enable IRQ back. Finally
> we get above error.
> 
> Fix it by setting ATH11K_FLAG_EXT_IRQ_ENABLED after all
> NAPI and IRQ work are done. With the fix, we are sure that
> by the time ATH11K_FLAG_EXT_IRQ_ENABLED is set, NAPI is
> enabled.
> 
> Note that the fix above also introduce some side effects:
> if ath11k_pcic_ext_interrupt_handler() breaks in after NAPI
> enabled but before ATH11K_FLAG_EXT_IRQ_ENABLED set, nothing
> will be done by the handler this time, the work will be
> postponed till the next time the IRQ fires.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
