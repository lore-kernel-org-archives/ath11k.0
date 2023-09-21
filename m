Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DF2E7D0A2
	for <ath11k@archiver.kernel.org>; Thu, 21 Sep 2023 20:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMrSrQSHI96i/Pf0PxYWpwJXVsRY8fpE21SW6AwvGmE=; b=JCwutKsU3pC0xn
	uzA2IpHohvfBGugj7Wv229juIR907fHMNsXlluGcqZY571iKBgDc0FssshZU6Oz+wD8gnIl/l9wqY
	vJhjU4mShlfnorv2/mYmw7/bxgbNRAX/TrLIUT2EFsiSxBiI3EAuepWC2/Cjahjd9CP8AXJxq/3S8
	KMQpDopW1gUAXvP4lcK1/ypi05aUWPBOUxAbt2Su4oqts40wrsrVZ7da/ZsszpdAll1z2KGj7fQbt
	ox41pQSfm6FegI72lVmaUyfZ/h93gxo8rZTBPGUm2Co7qeBcPTXPGHk08Id8TN+X4lQMw3HDbUUGV
	icJDLVkWEaBRoQOqJGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPv8-0072qR-2d;
	Thu, 21 Sep 2023 20:05:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjPv5-0072pl-2u
	for ath11k@lists.infradead.org;
	Thu, 21 Sep 2023 20:05:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38LK0s4J023564;
	Thu, 21 Sep 2023 20:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nd2coX3Io3J1zdVaMywkubEfRb7gBBcv9iB5ZPQnN1g=;
 b=orj4SrDBG2da92e7wkOx79lpFQJgnrrv6h2XQ26hUDYYxMfSgwmepcSjYCnVEkLmMy0F
 zfv2qqkCIWF+XgZtT3sw8GsNFl31xMKalIe8rKN+cbg9k5x/FaMcHEWYyNzGvRDF9JHd
 iwb4PjRhTX3fBgn2gF89UeueY6pcxm1dx7BOyxT6mOxChdGYQHciCs8o4cVDLBDIXoZG
 QSwvSYbX0gcHzdevyeb2pnc+9q5rEVV2mFakPr/vS8xWgNu2vFCSvG4frgcwFyzBACJC
 Zw5YKKer5cB55bChl6dXPRHGcIj+trTF820CCGjZr8XiNoj4plu5ITc1+TssViobb2vK SQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t8uf2g4s6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:05:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38LK4xZm011421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Sep 2023 20:05:00 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 21 Sep
 2023 13:04:58 -0700
Message-ID: <46f24f4e-b8ad-44f5-ab3f-1bcd3affc51f@quicinc.com>
Date: Thu, 21 Sep 2023 13:04:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/13] wifi: ath11k: save max tx power in vdev start
 response event from firmware
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230920082349.29111-1-quic_wgong@quicinc.com>
 <20230920082349.29111-9-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920082349.29111-9-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pmHdd8KybvafKUP5agZrJjJ7FxTvaVB_
X-Proofpoint-ORIG-GUID: pmHdd8KybvafKUP5agZrJjJ7FxTvaVB_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_17,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=783 mlxscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309210172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_130504_058253_6B568A1A 
X-CRM114-Status: GOOD (  10.14  )
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

On 9/20/2023 1:23 AM, Wen Gong wrote:
> Save the max tx power received in the vdev start response event from
> firmware. A subsequent patch will use this to calculate the final power
> value for WMI_VDEV_SET_TPC_POWER_CMDID.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
