Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA8AC433F5
	for <ath11k@archiver.kernel.org>; Fri,  7 Oct 2022 23:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZnMEfJVxsDZymjClXupCl+jLKdIRV/f8iUci165L4Y=; b=ogDdeNnxn5ZY1A
	xmnykP+whPp9MPsLXh3wpNoPWp25b3i/vW98Q1boj7py6hrvcT21+FdFG1eZ7Sw83/rAuMThwgA5L
	mHPFkTnp1yoaFHy0xB3L8ZPgrhHpY7OJHytvimA/YZ6r2D1ZoeVM6bqY0c5XI18p00UKDVYnQeEZH
	NAHxOxGNtaRPbp9reEi/oWOa8tfvsUfoQxGChutq+44Qa9pZMWX6afo7Agx1NVKXA+cIkm5YqjhFj
	1Sy2TUzYdZRNtkYcLG+AMsio00Of+vGV8Hv5vUG2vKnV/gvDmdxRmL5c4sgyhVS1WiVdpD7RF/NZg
	021ez4EqKrC8oMAvJPlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogwvh-00Awuu-2P; Fri, 07 Oct 2022 23:38:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogwvd-00Awsb-RS
	for ath11k@lists.infradead.org; Fri, 07 Oct 2022 23:38:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 297NYud3023951;
	Fri, 7 Oct 2022 23:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8I1cW7/4yhg0Og0d1xf5jllHlyekKBtaAu9Evb6nFEc=;
 b=WcrTr2eH47McUL74/v2LOhJ/drYDn8LhJ29OGD28/aX+F9bisCE7RxnGCekTp1VjVfoS
 d1a0nEjfhLL84RI3pSjxBNgHyYF3pttqjDOnN1+SGBXM2DJ64Ruqu0AylCC3kB9C1jaM
 mLvyeSlsGIeb8efisT7rC1zHhN8G4FnYmv+iHuu/OWigeLH05WlwvudUCr4jr5o+Km5N
 vvnnpGaiDoegkCGz///ZZfN1fym+X6a+b9v7OY5JLktD3tWAcSINBx7AAPSHj/Hn8XAK
 xxfg16X48YqWzm/a3bAvAWLZHAmv4lYYq/x5XG4y9ACdkfl2syuFI615uRZ/RDvSz3fV Pw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k2a7qta9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Oct 2022 23:38:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 297Nco8R028849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Oct 2022 23:38:50 GMT
Received: from [10.110.6.63] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 7 Oct 2022
 16:38:50 -0700
Message-ID: <014706d3-9f1b-cf13-5bca-67bfe7dd2207@quicinc.com>
Date: Fri, 7 Oct 2022 16:38:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 6/8] wifi: ath11k: initialize hw_ops for IPQ5018
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20221006105913.18356-1-quic_kathirve@quicinc.com>
 <20221006105913.18356-7-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20221006105913.18356-7-quic_kathirve@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C6HL-XiCgXwWjUAVdRr5JV9aA0il5TqW
X-Proofpoint-ORIG-GUID: C6HL-XiCgXwWjUAVdRr5JV9aA0il5TqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxscore=0 suspectscore=0 phishscore=0 mlxlogscore=650 clxscore=1015
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_163854_048158_FE6C88E3 
X-CRM114-Status: UNSURE (   7.97  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/6/2022 3:59 AM, Karthikeyan Kathirvel wrote:
> The ipq5018_ops is intialized for IPQ5018. This is different from

nit: s/intialized /initialized /

> other platforms.
> 
> Tested-on : IPQ5018 hw1.0 AHB WLAN.HK.2.5.0.1-01192-QCAHKSWPL_SILICONZ-1 v1
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> ---


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
