Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD668C27C53
	for <ath11k@archiver.kernel.org>; Mon, 17 Jun 2024 02:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAA0b82ySC2XaMvlsxxaWk275RX4AO5idW7Qwt57lxY=; b=p5FPJyGZ3nPw+RObU1FOBH7Zvc
	PfyZDL7RWfHFi405bhn+Dyo5LURmvadZdlLklSHANaOL2ULig5rtQNmUZKBSmNvxSDUdTR/vGsfQ6
	nR5yLrHAXrFvtpLenmUE7n3tr98vW6gIiQB0FB9/47Wy/tuiiieaVfciyziu3nAr8lRhvMqJ6DGGe
	Y+aG/TDAEh+WopRuAacSh9Dq2Shyij0RsxOFMbQrzOqc+FWkgEXZVayzl3T2uV0IS37qoVWiw0ZOS
	DnD2sDLlhnlBpS+xkVADo4VYkkpFiO0k61AQOYJBonYouPbH4o/WVjIXx44g1wbaL9mQC3okandPo
	/A1bnF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1wy-00000008pqy-0xVh;
	Mon, 17 Jun 2024 02:18:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ1wv-00000008pqL-1a3O
	for ath11k@lists.infradead.org;
	Mon, 17 Jun 2024 02:18:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H0gftK024282;
	Mon, 17 Jun 2024 02:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tAA0b82ySC2XaMvlsxxaWk275RX4AO5idW7Qwt57lxY=; b=LYBrGocyDUQssR5t
	bUNOxvkBHEzF3+h4TBPgAjcUHbQRTX5sx5iQRHpmmfwP7IAFrRIEvylgmyKLbPZc
	RPeNTLgiHu7KnbbrZvgGzSHSMe1MnN637SY/FkK5o5cXvp8lMXzSUjRr85zdD4Oz
	Xkyq/AmV8zT6mP4wnO21AmrSU5zWIyleyK+R5c9Rg/bNQC+FVk0RuZVxxKPQfwx1
	+nUuF/lAUSRLNG506ZmJG6cSKkApXbrgt99DDzODl8whfu4Z5fFsV7TMQwcYv+7Y
	cpdLaeSP+opAwRoWawTtGn1x4kXID8I+E+1lgmwVKkmZJzp9+Ni+9fA04DBN9ibW
	AdnMNQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys44jtcdm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 02:18:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45H2IIL2026082
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 02:18:18 GMT
Received: from [10.110.63.174] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 16 Jun
 2024 19:18:17 -0700
Message-ID: <841700e2-fb8b-4700-b794-17ea9abcb011@quicinc.com>
Date: Mon, 17 Jun 2024 10:18:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: ath11k monitor mode
To: "Lindner, Frank" <Frank.Lindner@ghmt.de>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>,
        "ath11k@lists.infradead.org"
	<ath11k@lists.infradead.org>
References: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <43b0cdc0-f489-410a-a702-5a5092b9bc18@quicinc.com>
 <8ab6d337-1c2b-40d8-80a4-2a1ca4092987@quicinc.com>
 <d93be101-4aa4-414c-bb1f-292d3f8fe27c@quicinc.com>
 <FRYP281MB0160C7239CB63E4061D4CDB4EB1A2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <FRYP281MB0160FB54135444832AA77E6AEBC22@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <FRYP281MB0160FB54135444832AA77E6AEBC22@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O4hy3mHHDKmzcOQQ4L3LFmj1TRohnsHx
X-Proofpoint-ORIG-GUID: O4hy3mHHDKmzcOQQ4L3LFmj1TRohnsHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_02,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=838 spamscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406170016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_191825_515022_FD20CBF6 
X-CRM114-Status: GOOD (  11.52  )
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



On 6/14/2024 10:24 PM, Lindner, Frank wrote:
> Hi,
> I didn't received any feedback on this?
> How can I get this module working?
> 
> 

Hi, there is another issue on this monitor mode, so we spent some time 
on it. At present, it seems that two patches are needed to fully fix it.

One is used to fix this srng warning, the other is used to fix crash.

I will send them to review group after verification by the testing team.


> BR Frank


