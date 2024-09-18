Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19DACAC5B2
	for <ath11k@archiver.kernel.org>; Wed, 18 Sep 2024 02:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLbP7gNDVw8sUSUpPEQsYXAN3U1YJKeYlju3li5Qyw0=; b=ub8sCTtPZf+fzz87ful4nafFy5
	Zy6xiJer4E3OMkyVW5Fon45xw6mBhcouX+TnR7P0+SQ3kPv1QZYaqMCABVgukqT2G63zK9JrZVnue
	CzqNr5dDrNJLv2UBZ+RC36yqEtorZr/B7/gMGU5wED3F9T/EFux2vwKE3/CdqCcyc9CjncnbUoGhn
	c+JjWEQdPjeKNUJw8qwuxs5T4tl8DeaEiPIPmjV1fgAMk1So9sKG3x4JBJY25L+WYvUSRbTXYt2/7
	0ZGKUhpbdEGsFHKLfBO+m9u2dqoCEuSZnLguWs4JK9d6eSkp0NUyVttk8bpMd6htblKYAI7x5B9Zj
	FIpFRfJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqkAA-00000007Iiw-26Vd;
	Wed, 18 Sep 2024 02:11:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqkA6-00000007Ihg-46Aq
	for ath11k@lists.infradead.org;
	Wed, 18 Sep 2024 02:11:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HJ2paN026870;
	Wed, 18 Sep 2024 02:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zLbP7gNDVw8sUSUpPEQsYXAN3U1YJKeYlju3li5Qyw0=; b=YiicZO0PlkfPX0d2
	/viWAdq+BwaazfkXiBulkkgxTiJhASVJ5txS0KgvVT/s9zmYXghOu4oVnOQd9pNO
	8rNZ2TQa7NFzr3HH53EHAgPSRSypEC4LRE67fjRPpzK/VRII9Y2hbHNOb8f7ICXf
	meayilyahtynEljAu81CO9QUqxtTjBdhgMp/SbCSa2xlB0wCCtbrJ8gRs35KupJy
	DVF3/Ugnz4KPOt/sZklla3YE1abiOFklVtaPiaPXSkxvS/pZi4NMwN9fLy//QAqJ
	8+dm2OzOjzuQoLCzaq86DoFbHJ53H9ku7jY0PcDhwpnhLB5ME5JHZ4f9oOs2+BJI
	nPBg7A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jdrhyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 02:11:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48I2BEM7026731
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 02:11:14 GMT
Received: from [10.253.39.169] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 19:11:11 -0700
Message-ID: <ec984b96-da25-4f81-a330-6c0070a032cd@quicinc.com>
Date: Wed, 18 Sep 2024 10:11:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: : ath11k monitor mode
To: Remi Pommarel <repk@triplefau.lt>, Praneesh P <quic_ppranees@quicinc.com>
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
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <ZuQ6jnHyXPZOiixu@pilgrim>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IfZBGOpcWAoR_uV804Hhbpj8dc4DhmXj
X-Proofpoint-GUID: IfZBGOpcWAoR_uV804Hhbpj8dc4DhmXj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1011 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=660 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409180011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_191123_060332_BFB8D4B2 
X-CRM114-Status: GOOD (  11.18  )
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



On 9/13/2024 9:13 PM, Remi Pommarel wrote:
> On Fri, Sep 13, 2024 at 06:11:33PM +0800, Kang Yang wrote:
>>
>>
>> On 9/13/2024 2:59 PM, Lindner, Frank wrote:
>>> Hi everyone,
>>>
>>> is there any update on the topic ath11k monitor mode?
>>> We prefer to use QCA chipsets, but currently its not possible.
>>>
>>
>> For QCN9074, full monitor mode should work with below patch-set.
>> https://patchwork.kernel.org/project/linux-wireless/cover/20240913100708.756-1-quic_kangyang@quicinc.com/
>>
> 
> Does full monitor works without [0]. Last time I checked it didn't on
> QCN9074 with WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1.

Not sure, Praneesh, can you reply this?

> 
> Thanks
> 
> [0]: https://lore.kernel.org/ath11k/505773d9e20d14c22ce1a56ac640ba442b29ae4a.1700731974.git.repk@triplefau.lt/
> 


