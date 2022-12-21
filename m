Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41711C4167B
	for <ath11k@archiver.kernel.org>; Wed, 21 Dec 2022 12:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eNpoAhOY7wQiNluBuS5Cghw/r/X1OTg0O86xPwZBleI=; b=iEmIYyKmszPo9V
	+k/xKDroWceFxgA9Huq6ZUu9fPgl5DGisORx3KDkHfi5snAxm1iNPOuyfpCtkmcHWEtI3ftn0238a
	xCA+E8+xI7gUrT5SFqPTPqewuyBp+2j+XVzulGAjgf3UQNBy+V6K5FhTCMV6aiWrwohz7XuoyMTL3
	h+jSDLAVo7zvY/qdTK/2J8thnEphfAHpVRIF4xM2WQedaj++nXMyQWIC00ZqXm3hrORma9d1zRURP
	shXnKQwF7NuQJv+CXeoXBh1bFJ7tLkQ/dvDesn1Iy/OIQhnHJ1WrCo8AWyIzg8SpA2CeJzI3FKH5a
	D/FDQnndhTonSfaCuLqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yfV-00EroT-4p; Wed, 21 Dec 2022 12:57:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ycv-00EqWe-KM
	for ath11k@lists.infradead.org; Wed, 21 Dec 2022 12:55:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLBkXaU026338;
	Wed, 21 Dec 2022 12:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Gr2ppm/9k20t36MCYR7dtOWlbbt7FS0wWx8ISJx5mYs=;
 b=QFG0dQa/xxtHsoEvp2myRuWOVKDosQNo9/8iGFsmWNvp2IOxatl26mvuKkEyaVly1B4q
 tth9rzyedQeDISqFot/eLQpKH4uXpYG4c9pGjvnpArfLTQKmiWQHHNR0GMKLFSPIn4KW
 HIf96PJW23d7dYUOX+Zd/o4dnhZ0dTyx3Cok1hRAOUho0neg8Tqwy637ry+mfzWcTJGU
 qdgEm5aFZWKJndlsN1JiobizP99uJ5A+HQfIH2aADXVvv+UWgGy47HyfzMy6iWiel+Qx
 KpajKwVluZ70L9NLR429m59QzdD4ab73kT+JHNcdLful6+5KG+1cDNUplpC+2wrtzKeK TA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk83xub44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 12:55:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLCt9Lu011012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 12:55:09 GMT
Received: from [10.242.243.166] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 21 Dec
 2022 04:55:06 -0800
Message-ID: <c73a9b25-f7b7-5265-7a86-8b599aaa6df9@quicinc.com>
Date: Wed, 21 Dec 2022 18:24:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 2/3] wifi: ath11k: add support to parse new WMI event
 for 6 GHz
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Lavanya
 Suresh" <quic_lavaks@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>
References: <20221214164639.31542-3-quic_adisi@quicinc.com>
 <167162704604.23347.8011938867680129068.kvalo@kernel.org>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <167162704604.23347.8011938867680129068.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1KYjvwduQS3wr34P15kDfyVd1atUD2LB
X-Proofpoint-GUID: 1KYjvwduQS3wr34P15kDfyVd1atUD2LB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_06,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=921
 clxscore=1011 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_045517_917570_93E4C0E3 
X-CRM114-Status: GOOD (  12.99  )
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

On 12/21/2022 18:20, Kalle Valo wrote:
> Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:
> 
>> In order to support different power levels of 6 GHz AP and client,
>> new WMI event for regulatory - WMI_REG_CHAN_LIST_CC_EXT_EVENTID is
>> added in firmware. This event provides new parameters required for
>> 6 GHz regulatory rules.
>>
>> Add support for parsing 2.4 GHz, 5 GHz and 6 GHz reg rules and other
>> parameters from WMI_REG_CHAN_LIST_CC_EXT_EVENTID.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>
>> Reported-by: kernel test robot <lkp@intel.com>
> 
> I don't think using Reported-by is correct here. You are
> adding a new feature, not fixing a bug reported the bot.
Bot did report a bug in v1 Kalle. That I fixed in v2.

> 
>> Signed-off-by: Lavanya Suresh <quic_lavaks@quicinc.com>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
>> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> This patch added new checkpatch warnings, they were too complex for me to fix them:
> 
> drivers/net/wireless/ath/ath11k/reg.c:678: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.h:4090: Please don't use multiple blank lines
> drivers/net/wireless/ath/ath11k/wmi.h:4212: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.c:5002: line length of 91 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.c:5102: line length of 94 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.c:5208: line length of 91 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.c:5209: line length of 92 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.c:5235: line length of 95 exceeds 90 columns
> drivers/net/wireless/ath/ath11k/wmi.c:5298: line length of 91 exceeds 90 columns
> 
Sure Kalle, let me see how I can fix this.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
