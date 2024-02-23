Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A469C47DD9
	for <ath11k@archiver.kernel.org>; Fri, 23 Feb 2024 03:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/4LHV7qGsFNctQERPBvGY2nISXG2Y31BrMexbTCzEzU=; b=mdvnv8yvznekY5Q0Bpz4AIO/ot
	idntfKYuOaEZUXPgSjmmit8VeFsNPjNIG82CwJT4Bxz4D6w4dE89TKaEfBsbS9ZLYhmakDAwz6KcH
	eRDEjuczDhMxYmJ84lwDvijrTr8zuAJpsp5DmQzWZz4FDC2qVerhrgeNBfSCDIp1ecO8ugQlTPeUg
	H567kqUweK9l+ueIUqCxeh1SuR0vNjCY3WbT33OMX5cv27j+us7zEc24DZdn1cKwwYOiRo/r0UPgb
	A5dUHK0ds2/c9r48WIdDz2PTuh8p9zhmsYqktruQpJw7YKpaKQZUAwbzU7Ezz1tWMRiHiMAw0FY1h
	EXtx20NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdLqR-00000007ckG-3R7U;
	Fri, 23 Feb 2024 03:03:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdKnb-00000007SYg-2MhP
	for ath11k@lists.infradead.org;
	Fri, 23 Feb 2024 01:56:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41N1GJQi030552;
	Fri, 23 Feb 2024 01:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/4LHV7qGsFNctQERPBvGY2nISXG2Y31BrMexbTCzEzU=; b=Dy
	pjd1aRZGTe1iRzUvKKN2IKewfWPsP16+A57il+WPIzl1ZGrq3uQ7JlvE4ZouqacP
	T73u8Z3siUOxWlptG9sXNqmDrRXX65fIkNO33tgrGnVuSGHVhtqR6bl+QBnumYD+
	SD7gPL/OMmqrQPucf3yQeZo/g886fTrYnd8uVlT7/valZHMcBpSP8gJdEzDxrhAk
	EBO+rGvOkYSdrjDtMEFry2f7BtMUmhzOQFPExLkBQJd+lt2k1dbxZaaxIZPINbhb
	9cwbBD6zRdRwH73aWKYU7rLhhlrW31HWaHQ/OHQFSJPc+Gk4y3HW4si7mmIvGA7Z
	7u3W/oSptmZFKOuR+AJQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we3231sya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 01:56:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41N1uGBj022203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Feb 2024 01:56:16 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 22 Feb
 2024 17:56:15 -0800
Message-ID: <df35ce71-84dd-4c2c-af9a-820cb9a71291@quicinc.com>
Date: Fri, 23 Feb 2024 09:56:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k multicast action frame RX
Content-Language: en-US
To: James Prestwood <prestwoj@gmail.com>,
        "open list:MEDIATEK MT76 WIRELESS
 LAN DRIVER" <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <dcdbd757-ad6e-4fe0-a0c1-fe328431b73b@locusrobotics.com>
 <642b61a6-e3c0-4831-887f-f25314bf166d@locusrobotics.com>
 <90ac3bdc-8797-4d57-8bc9-48e0ad406674@quicinc.com>
 <1dafe0e5-292b-4764-86c7-cc1757aeb3b6@gmail.com>
 <ed8eeb92-e1eb-445e-989d-2340c26faf44@quicinc.com>
 <7a62031b-ad1f-4da2-8217-19a5d7fdc0f4@gmail.com>
 <f363f179-b41f-4bea-882f-e4aacb8ad519@quicinc.com>
 <eaeb8e9b-3809-4f89-a5b2-7949aa01fbde@gmail.com>
 <026d9ba3-525d-4a12-8d03-5fece818330c@quicinc.com>
 <0e8ad2c2-cc39-4903-97f7-c3ffb525e61a@gmail.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <0e8ad2c2-cc39-4903-97f7-c3ffb525e61a@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zw4c1t10bJX-PTpV5eJ0pQBsTlveKi0B
X-Proofpoint-GUID: zw4c1t10bJX-PTpV5eJ0pQBsTlveKi0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 mlxlogscore=500 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402230011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_175628_145551_CB3B75A9 
X-CRM114-Status: GOOD (  10.89  )
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



On 2/22/2024 11:38 PM, James Prestwood wrote:
> Hi Baochen,
> 
> On 2/21/24 6:26 PM, Baochen Qiang wrote:
>> But you are using monitor mode, not station mode, on ath10k, right? 
> 
> No I'm using station mode. It looks like ath10k creates a monitor device 
> to receive these frames (that was already done before my patch), but the 
> interface I'm using from userspace is a regular station interface
> 
OK let's forget what ath10k does to receiver those frames for now and 
focus on ath11k. From what I got from firmware team, it's expected that 
ath11k station interface can't get those frame without a scan because 
device A is connected to an AP already and is supposed to get frames 
only from within the BSS, apparently device B here is not within that BSS.

> Thanks,
> 
> James
> 

