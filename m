Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C47C4332F
	for <ath11k@archiver.kernel.org>; Wed, 21 Dec 2022 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXPa7stRbHB8+AOQxFb2EecmBbX6CRB3lxjd2HSISPk=; b=ufn9E1CPs2ScCD
	TJVCyYJyU1YlRfA6i/D3NF6eMKLVOVj0C2D4/FR59HVV9HjWAhqxLa91FnKSUAwHrTCgBB/LPHApQ
	tpnI1QOoNcCifAjTxrfIqXtIwPBK5ZbdqxbvJ93ucluIdeIMlVG7U0mrP/50TC3tYKxhWNOvxdKwK
	kJV9/dUljfpl/k556YTL45ybQhPJLPiXlvX1jGWFATeBOrLs2Vgjmc3r/87AVJ3GTxXCv+gJBWX9s
	a10FxthY9F8VpwPq9IfBvlguWS5yZpiL/9Ni3bH6Apn8Kh3cmqZiTwGYvCusodrwaBE8Aqy3ZjC6W
	Bedlki+cjcxL9gcxfFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ygi-00EsPX-K1; Wed, 21 Dec 2022 12:59:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yeX-00ErMP-82
	for ath11k@lists.infradead.org; Wed, 21 Dec 2022 12:56:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL8i8uf015471;
	Wed, 21 Dec 2022 12:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vvaiUbkWrouE/hBrcPGBsJpV4BrM+h3KrWhBkheetH8=;
 b=IxC8KvGrQFmPMIh6bdNfkHe0jpQqIIu5xwxec8FRHUpd1avfOY16+8hmHW/3zlRZ5LHU
 lM4WEhm1qirdyBsZ3NBhfFWgHcWJVTU1Cx6seHE7Y53PDPQCHxoWJmzHDM4VcR0TjnGr
 xcxtmnt7vC12RFcImGujmjvLTIeNWQpzV1i6pfTDlaziyT/5l9B7NU+5wwtY/I2a64fa
 OUgJwGyNOWbQ2bXYwB46jVbQXNPrpza2NjgUOhp5QCI3x62rXTk7UaiDfoYFAAx0UNQa
 UfkXIkvQrvQIjIT+ZCjg8rDRL666pO5dSkmjFh/NKvnVmd37D54AUzIwx2ittZZ03h16 ug== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mjyk54b1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 12:56:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLCuprL002439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 12:56:51 GMT
Received: from [10.242.243.166] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 21 Dec
 2022 04:56:49 -0800
Message-ID: <cf9ce566-04d2-dd5f-95a3-13045fcf5439@quicinc.com>
Date: Wed, 21 Dec 2022 18:26:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 3/3] wifi: ath11k: add debug prints in regulatory WMI
 event processing
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20221214164639.31542-4-quic_adisi@quicinc.com>
 <167162718423.23347.17706545802283934057.kvalo@kernel.org>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <167162718423.23347.17706545802283934057.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5iu0byiqUtkCDgouuX0x9StpjslX93gx
X-Proofpoint-ORIG-GUID: 5iu0byiqUtkCDgouuX0x9StpjslX93gx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_06,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_045657_408257_749484A9 
X-CRM114-Status: UNSURE (   9.36  )
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

On 12/21/2022 18:23, Kalle Valo wrote:
> Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:
> 
>> Add some more debug prints in processing regulatory WMI event in order to
>> increase more debuggability.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> I see new warnings also here:
> 
> drivers/net/wireless/ath/ath11k/wmi.c:5494: line length of 111 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.c:5495: line length of 110 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.c:5496: line length of 112 exceeds 90 columns
> 
> Please run ath11k-check.
> 
Okay let me fix this.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
