Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70332FA373B
	for <ath11k@archiver.kernel.org>; Fri, 13 Sep 2024 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFNGHmyphJ1/ZVVFS8aRP/Qqi022ci/g4xJ+ITHuCJI=; b=ztANKgdM0a8eQH9HttakitGGn9
	xaHuLJrRbpdIkU/2t5+7OuVIxcuYhnPRQezkAiouYl9kpL3Hz2a/QQ49UZMQE8wZiN2DQmby/wMb3
	ev9FWo3j7zqHWFRnvDxwVNLrY8r/pCCaMyE7oMreqn9pWlIyNh8wDRnZurgiA1P1euGowSfs5+hAu
	gshhvcupEpJmlpZpzTZhpqFDLbgBiSD4JU3stImOqPEpMTYLocOzXHKr5W7/oHcJSy8W75MVtTY4b
	ALV3F7PjDYCiOZoOvVtlyNROnK6mChOJLd+Him3bfGweP6ZzRMngIJDGsGIrc9If7XkaVHt4RGjhy
	MHTswUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3HF-0000000FZrX-3nQl;
	Fri, 13 Sep 2024 10:11:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp3HB-0000000FZr2-1EfJ
	for ath11k@lists.infradead.org;
	Fri, 13 Sep 2024 10:11:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48CMB6KW020730;
	Fri, 13 Sep 2024 10:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HFNGHmyphJ1/ZVVFS8aRP/Qqi022ci/g4xJ+ITHuCJI=; b=Tepjd0Wu5v/z7vVF
	lKxTOvCaNqxWULUXtHfiBD/b0MZH/f6Ub6DuuTGg7TJc1LgC1vKq+upmbi0eDxg4
	c+MotPilf8mJOEyKOSWKdUeyZrVz8AzRiDYN2mYU1oQ+kICBRqLS1Lf+jick1cSn
	ERPXCpxaJ7JcUgZK+PB6vJvfkOpgAv0KfmPiGiWYqjRv/7OaowzLSLloCTXatf4I
	UQGyud10a7B1QTkVifA+TdB1eyTD5fEbyub3pH1B67O7qXhK+ZID5pDZQp+6Yozq
	h47DZQGF0sd4J1vMi6GuxYKz9HxgBfLsJ1nCx/U9S4eun+z798KPsUmpZjAuJUVp
	dezOTg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy6pga08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 10:11:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DABbtC023137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 10:11:37 GMT
Received: from [10.253.73.210] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Sep
 2024 03:11:35 -0700
Message-ID: <258cd677-edb1-46a3-9e51-9f6a101c5a2d@quicinc.com>
Date: Fri, 13 Sep 2024 18:11:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: : ath11k monitor mode
To: "Lindner, Frank" <Frank.Lindner@ghmt.de>,
        "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
References: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <43b0cdc0-f489-410a-a702-5a5092b9bc18@quicinc.com>
 <8ab6d337-1c2b-40d8-80a4-2a1ca4092987@quicinc.com>
 <d93be101-4aa4-414c-bb1f-292d3f8fe27c@quicinc.com>
 <FRYP281MB0160C7239CB63E4061D4CDB4EB1A2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <FRYP281MB0160FB54135444832AA77E6AEBC22@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <841700e2-fb8b-4700-b794-17ea9abcb011@quicinc.com>
 <669135a4.170a0220.8fbf0.26d5@mx.google.com>
 <FRYP281MB016057FD5857443FBBB1DD28EB652@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <FRYP281MB016057FD5857443FBBB1DD28EB652@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HpuSitCSyZtteXFTpZBAEEzmEbT748L0
X-Proofpoint-GUID: HpuSitCSyZtteXFTpZBAEEzmEbT748L0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_031141_363501_FAF6E835 
X-CRM114-Status: GOOD (  14.22  )
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



On 9/13/2024 2:59 PM, Lindner, Frank wrote:
> Hi everyone,
> 
> is there any update on the topic ath11k monitor mode?
> We prefer to use QCA chipsets, but currently its not possible.
> 

For QCN9074, full monitor mode should work with below patch-set.
https://patchwork.kernel.org/project/linux-wireless/cover/20240913100708.756-1-quic_kangyang@quicinc.com/

But for WCN6855/QCA6390, monitor mode still needs some patches.



> TIA, BR
> Frank
> 
> -----Ursprüngliche Nachricht-----
> Von: ath11k <ath11k-bounces@lists.infradead.org> Im Auftrag von Giedrius
> Gesendet: Freitag, 12. Juli 2024 15:55
> An: ath11k@lists.infradead.org
> Betreff: Re: AW: ath11k monitor mode
> 
> On Mon, Jun 17, 2024 at 10:18:14AM +0800, Kang Yang wrote:
>> Hi, there is another issue on this monitor mode, so we spent some time
>> on it. At present, it seems that two patches are needed to fully fix it.
>>
>> I will send them to review group after verification by the testing team.
> 
> Are these patches available anywhere?
> 
> I would be interested in testing them out, even if unverified.
> Currently, any significant WiFi traffic is causing RCU stall on monitor interface.
> 
> Thank you,
> Giedrius
> 
> 
> 
> Vorstand: Dirk Wilhelm (V), Wulf Jannsen
> Aufsichtsrat: Ron Scheepers (V)
> Handelsregister: HRB Saarbrücken Nr. 13201
> Ust.ID Nr.: DE 153807627
> 


