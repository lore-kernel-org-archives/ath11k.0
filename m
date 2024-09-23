Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1070CF9C71
	for <ath11k@archiver.kernel.org>; Mon, 23 Sep 2024 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi+H6yM2kVV3bjEa/dRcTwKb2PXF59MwZX1YQ2+HVkg=; b=uslG791i4EgGXaVvU0wVVlMGNl
	4DgY03YsHzdfZe7PutfKZZUp9heRBke2xZLFbTlGnKdkkhTF+TBX/1VIubUN/7d0DxXDIm5W7nfMC
	uf6v5cm9Jspu6P4FEgcg25Dnv4sbtAuX/HjqoGTRktOcyCYrRfM7Mrqw11hseFtpl5gHe+AhWhoQt
	FPx3e+fdnRYi7A2GJwVrHtnycEf4QZxjOH8bUFPl7aAVxfc6kLNnvxnzWKmR0yCfmKVZ1913ajxz2
	skiKMxQipWbKPtB2WVNMeV/f68Wzmuq5GP/cINszEtVBaLc6MA1ck8TH2w9G5U4FDh7Guv7FSmNjc
	0GwJPGkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmou-000000009WL-1CWp;
	Mon, 23 Sep 2024 17:25:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssmor-000000009UO-0M1J
	for ath11k@lists.infradead.org;
	Mon, 23 Sep 2024 17:25:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NBAHGg011416;
	Mon, 23 Sep 2024 17:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bi+H6yM2kVV3bjEa/dRcTwKb2PXF59MwZX1YQ2+HVkg=; b=msi0iKwe4Yaxs+EL
	zfnVDy8WUha7inqJBnDPfybEjvuIwgf7d8afWB3IUPd3ANhKOwQuQm9Ni7s0Th3t
	LEroRxmkwQ1tog0lXUYpyq4ymKafha/EhW0aFiLE8MuyoeuA8Bir/b9cN6OcdjxH
	u3w21KkZqgASL7tZ/OWLaZRx67OnEqqraEfXDiHogiUf76WN3cN3VYyFCegaz7pd
	xhm4rgQPQDAnjmF/RhnPqXwVJkhW1uALI7UFOLG2rUWKIb+hMWAP7KxGf4eu3KjI
	RVQbJGr/KBbqlTZbVcNO9Ym2uN3NMN4hol/3iYoBZjc09Z2IiSvnNtRkCusOugV4
	T2eGew==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skuenpu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 17:25:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NHPeEv001067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 17:25:40 GMT
Received: from [10.50.29.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Sep
 2024 10:25:39 -0700
Message-ID: <d376023d-267a-4512-8749-f816fefeb842@quicinc.com>
Date: Mon, 23 Sep 2024 22:55:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: : ath11k monitor mode
To: Kang Yang <quic_kangyang@quicinc.com>, Remi Pommarel <repk@triplefau.lt>
CC: "Lindner, Frank" <Frank.Lindner@ghmt.de>,
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
 <258cd677-edb1-46a3-9e51-9f6a101c5a2d@quicinc.com> <ZuQ6jnHyXPZOiixu@pilgrim>
 <ec984b96-da25-4f81-a330-6c0070a032cd@quicinc.com>
Content-Language: en-US
From: Praneesh P <quic_ppranees@quicinc.com>
In-Reply-To: <ec984b96-da25-4f81-a330-6c0070a032cd@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 31OOrusR0VAdBWnjn2ntMbYbXTVnK4in
X-Proofpoint-ORIG-GUID: 31OOrusR0VAdBWnjn2ntMbYbXTVnK4in
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_102553_173184_EF707777 
X-CRM114-Status: GOOD (  13.36  )
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

On 9/18/2024 7:41 AM, Kang Yang wrote:
> 
> 
> On 9/13/2024 9:13 PM, Remi Pommarel wrote:
>> On Fri, Sep 13, 2024 at 06:11:33PM +0800, Kang Yang wrote:
>>>
>>>
>>> On 9/13/2024 2:59 PM, Lindner, Frank wrote:
>>>> Hi everyone,
>>>>
>>>> is there any update on the topic ath11k monitor mode?
>>>> We prefer to use QCA chipsets, but currently its not possible.
>>>>
>>>
>>> For QCN9074, full monitor mode should work with below patch-set.
>>> https://patchwork.kernel.org/project/linux-wireless/cover/20240913100708.756-1-quic_kangyang@quicinc.com/
>>>
>>
>> Does full monitor works without [0]. Last time I checked it didn't on
>> QCN9074 with WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1.
> 
> Not sure, Praneesh, can you reply this?

Hi Remi,

I have reviewed [0], and this change is necessary to prevent chipsets 
that support full monitor from accessing the destination ring meant for 
classical monitor.

One minor suggestion for this patch: pmon->mon_ppdu_status should be set 
to DP_PPDU_STATUS_DONE before the if check. This ensures that the 
ppdu_status transitions correctly from DP_PPDU_STATUS_START to 
DP_PPDU_STATUS_DONE for full monitor supported chipsets.
> 
>>
>> Thanks
>>
>> [0]: 
>> https://lore.kernel.org/ath11k/505773d9e20d14c22ce1a56ac640ba442b29ae4a.1700731974.git.repk@triplefau.lt/
>>
> 

