Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCFACCFA15
	for <ath11k@archiver.kernel.org>; Thu, 26 Sep 2024 03:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKAqh7ax0lL+dAm0XRSOK/k01MOqx17APzaO5aqfypQ=; b=yksYYuwbaGst/SKoZd2opyaZlN
	7GpeC7sKtzaEHipa2QjdIyLTS37rIi/NNIb7rCV5F8juJyPT6ir3GhER1y2KnTIzteJKTSIgJiwhV
	ruNfBdE5IcbWT7eYau3unc+C6Tpz4/bJFX/LrHE2oONnTrb8rvWomr4A15giYo6v2Vo3r9KOADlvo
	8KDM9yQwoBhqNdcZrnBft/uz/MF0piCFCFN7EI7j4mo5frcxWVOPBAdez+pW7/Vgk5ZUnI2ZFyjXk
	psSsxQEO77Y9oaNtlVahn61GalVSpYt/iZkZKPKRDf+4QuhU01IlPkyIAsDoqpaj0cz8enMB637jU
	XXo0AqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stezx-000000073kF-2MuC;
	Thu, 26 Sep 2024 03:16:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stezX-000000073in-3jav
	for ath11k@lists.infradead.org;
	Thu, 26 Sep 2024 03:16:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5DJG008242;
	Thu, 26 Sep 2024 03:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hKAqh7ax0lL+dAm0XRSOK/k01MOqx17APzaO5aqfypQ=; b=ThocKRfCY5Gz16o8
	ZrgrQde4p9W//yUnftra8hFmpvzHbVIvoBZYK+7E2xVmJ2TerRUbBkWLXaATfTFD
	bOUcLPx4dLsSep9YLUyPyMRrlDgbAG2wCuuG0IiCdA/qN6LVJiORVarOAMYkoitx
	Ak0hITc+PW3upKRIuCLQHpVKt7KJwFv/UeIKRXq3TmvVjtWtwoxQiZOezR4fXCNh
	Fjw7srd4sNPHoA4QEC5cSl6ZGFX4gBEmZUiRl0KnRtvhH9PgRJiL/pDSkHHnEw+k
	BJD/g1A4G7S5fuNoj7A+Ro+MOOkI+rX0OFeyanUhbc/xJ/ZgFarLq2FhN+PVPgH1
	yc9yiw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skuex469-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 03:16:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48Q3GTQx019832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Sep 2024 03:16:29 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 20:16:28 -0700
Message-ID: <70567137-dfb9-4896-9e6c-6c02a97228cb@quicinc.com>
Date: Thu, 26 Sep 2024 11:16:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k/WCN6855 neighbor report request made immediately after
 connection gets no response (with MFP)
To: James Prestwood <prestwoj@gmail.com>,
        "open list:MEDIATEK MT76 WIRELESS
 LAN DRIVER" <linux-wireless@vger.kernel.org>
CC: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <eb41d8ec-c4f1-474e-a938-099f27aa94e3@gmail.com>
 <fd90d471-503b-4f58-ae11-bae2afab08c7@quicinc.com>
 <0d1dab88-66a0-48c1-bdbe-777d07c3132e@gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <0d1dab88-66a0-48c1-bdbe-777d07c3132e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uT2kmp040eVZOaWB7O-gGzh5O8MC_Nsw
X-Proofpoint-ORIG-GUID: uT2kmp040eVZOaWB7O-gGzh5O8MC_Nsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409260020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_201631_995261_85DD20F5 
X-CRM114-Status: GOOD (  22.73  )
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



On 9/25/2024 7:33 PM, James Prestwood wrote:
> Hi Baochen,
> 
> On 9/25/24 3:07 AM, Baochen Qiang wrote:
>>
>> On 9/19/2024 8:21 PM, James Prestwood wrote:
>>> Hi,
>>>
>>> I noticed an issue when we started putting ath11k clients on a WPA3 network which seems to be related to the fact that management frame protection is enabled (works fine on WPA2 no MFP). Immediately after an initial association a neighbor report request goes out and we get no response from the AP. After getting a PCAP in one case we noticed the neighbor report request went out unencrypted, though still had the CCMP IV parameter. The content of the request was the unencrypted request, and something like 15 bytes of 0x00 padding. I will say, this initial PCAP was made through the AP vendor so perhaps it automatically added the right keys to decrypt the frame, this could be a red herring. I tried on my home network and it was hit or miss, sometimes I would get a response but sometimes I wouldn't, but I did see the frame was always encrypted in my home network case though when adding the PMK directly in wireshark I couldn't decrypt it, where on other hardware like iwlwifi I
>>> could.
>> is your home network also WPA3?
any comment on this query?

>>
>> and how did you get the PMK? is it generated by IWD and printed as debug message?
> 
> I actually had to modify IWD to print out the PMK after it derived it. WPA3 makes this a huge pain since the PMK differs between SAE exchanges.
> 
> I've attached an IWD diff that prints out the PMK, which can be added to wireshark if that helps.
Thanks, I found another way to do the decryption.

> 
>>
>>> Some time after the connection neighbor reports work fine. I'm not sure of a time frame or delay required that gets them working, but it makes me suspect that ath11k doesn't have the keys fully added in the firmware before userspace gets signaled as "connected". Running the same scenario on ath10k or iwlwifi has no issues. This neighbor report request immediately after connecting is IWD's default behavior, so its relatively easy to test by just restarting IWD.
>> I captured a WPA3 SAE PCAP too, but only can find some unencrypted ADDBA req/resp frames. for those encrypted action frames I am still struggling to decrypt them
I checked all the action frames after decrypt the PCAP, but still not able to find a 'neighbor report' frame. next will study IWD code to understand how such a frame is triggered.

and again, if not possible to share the complete PCAP, can you share the individual 'neighbor report request' frame ? you can simply copy it in wireshark.

>>
>>> Since the neighbor reports work fine after some time its not really a critical issue but I wanted to bring it up just in case.
>>>
>>> Thanks,
>>>
>>> James
>>>


