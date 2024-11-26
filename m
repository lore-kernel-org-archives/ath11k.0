Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25510D5A6F9
	for <ath11k@archiver.kernel.org>; Tue, 26 Nov 2024 08:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieQIQcSD1s/suoarC7a7OhIQJzw3wBSvD9UoY9+DS6s=; b=UC0BrGHumdU7dDOVdEN+ZF8IKQ
	orFKfEkt0AyzzAVdxsWn7YOJ2sYhUkhfkUfIPZJgbx0dq4QHX78WV6aM89hVUKnCW5WHlGILvbJ8N
	MhAogUo3NzlCsTQdEZRBC/kp1UGS/Gv540L7nDEcE64cB07tAOtfE8C1pEIW6+WqflQorj+sjkTss
	jHF14kp/9I4Of/ihcrmg/Tf5IVR42Xvx4xXzlm3bzlZSlnpvz2/Ju8yb6wSTCVU63Za36dhSsVzMM
	IKO6SZODEbhxCBiv5bgBp71uOpzdS5bh+PZmsGsCwJuj810hBOQnjug4X1a3QeoyRl61KgURrWLIf
	m5U1wKTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqiB-00000009wPh-34lE;
	Tue, 26 Nov 2024 08:14:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqi9-00000009wPB-2Ol6
	for ath11k@lists.infradead.org;
	Tue, 26 Nov 2024 08:14:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APJcfYW020756;
	Tue, 26 Nov 2024 08:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieQIQcSD1s/suoarC7a7OhIQJzw3wBSvD9UoY9+DS6s=; b=XRXGqcPjWABEIlwT
	N0HfK8vywNPSg6vqv/YiTGFDdiE8DmnD9LYnRz02TknSiHoQMFHBY+pQNbxU1oPC
	Niu9RL8sl1JxJlXqhJaFS+LgH+VbQEuNgmHbMP07QhFKVWqSHVEggv2HKGVN0IEg
	ZVxP1cBJ1JLCVZ8eOn7ATnVkod6Yh1IOhWiFTyea3T7vaImj/kq7AuXZ8ntVPtEx
	Gn6lhhTWeIJsysaa68KVr4TyEEguyzyAwbk1AsHnZ8dtzR6h/8W6Sck7nz3I3i32
	dXuRdat3CYhFblwbD9MINtG4jshlQmdb7/43CXOXFAq0gNGxQ1jXWRz4ZcXrQOFW
	qXKxMw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43374sycws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 08:14:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AQ8ECkT026481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 08:14:12 GMT
Received: from [10.231.194.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 26 Nov
 2024 00:14:11 -0800
Message-ID: <ed719ad2-dc79-4883-8484-05e615ae211e@quicinc.com>
Date: Tue, 26 Nov 2024 16:14:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: support DBS and DFS compatibility
To: Mihai Moldovan <ionic@ionic.de>, <ath11k@lists.infradead.org>
References: <20241125100508.3458594-1-quic_yuzha@quicinc.com>
 <90c806db-9d75-4c25-88f5-252da80b5d40@ionic.de>
Content-Language: en-US
From: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
In-Reply-To: <90c806db-9d75-4c25-88f5-252da80b5d40@ionic.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ryGDagac56UFz3dQ-aGrad0aqsdMo_UU
X-Proofpoint-ORIG-GUID: ryGDagac56UFz3dQ-aGrad0aqsdMo_UU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411260065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_001417_740995_DD684E58 
X-CRM114-Status: GOOD (  11.57  )
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



On 11/26/2024 2:09 PM, Mihai Moldovan wrote:
> * On 11/25/24 11:05, Yu Zhang(Yuriy) wrote:
>> Add a ieee80211_iface_combination to support DBS and DFS compatibility,
>> one combination can support DFS(same with non dual sta), another
>> combination can support DBS. When running different scenarios that will
>> use different ieee80211_iface_combination due to mac80211 will go through
>> all of possible interface combinations.
> 
> Are DFS and DBS mutually exclusive features? I can imagine that ISM 
> clashes with DBS, but wonder if this is a hardware limitation, a 
> firmware limitation or merely an implementation limitation so far that 
> might eventually be lifted.
> 
You mean when run dfs channel why only support one interface, right? 
Your can refer to wiphy_verify_combinations().
> 
>> The chips affected are:
>>
>>   QCA6390 hw2.0
> 
> Tested-by: Mihai Moldovan <ionic@ionic.de>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
> 
Thanks your tested-on QCA6390. I will update with adding this.
> 
> These were the tested configurations:
> 
>    - 5 GHz on DFS channel:
> 
>          Interface wifiax
>                  ifindex 6
>                  wdev 0x1
>                  addr 20:57:9e:2d:04:1e
>                  ssid WRTKA05
>                  type AP
>                  channel 100 (5500 MHz), width: 80 MHz, center1: 5530 MHz
>                  txpower 20.00 dBm
>                  multicast TXQ:
>                          qsz-byt qsz-pkt flows   drops   marks   overlmt 
> hashcol tx-bytes        tx-packets
>                          0       0       454     0       0       0       
> 0 61456           454
> 
>    - 5 GHz on non-DFS channel + 2.4 GHz (DBS):
> 
>          Interface wifiax24
>                  ifindex 7
>                  wdev 0x2
>                  addr 22:57:9e:2d:04:1e
>                  ssid WRTKA06-Tasmota
>                  type AP
>                  channel 7 (2442 MHz), width: 40 MHz, center1: 2452 MHz
>                  txpower 20.00 dBm
>                  multicast TXQ:
>                          qsz-byt qsz-pkt flows   drops   marks   overlmt 
> hashcol tx-bytes        tx-packets
>                          0       0       61      0       0       0       
> 0 8562            61
>          Interface wifiax
>                  ifindex 6
>                  wdev 0x1
>                  addr 20:57:9e:2d:04:1e
>                  ssid WRTKA05
>                  type AP
>                  channel 40 (5200 MHz), width: 80 MHz, center1: 5210 MHz
>                  txpower 20.00 dBm
>                  multicast TXQ:
>                          qsz-byt qsz-pkt flows   drops   marks   overlmt 
> hashcol tx-bytes        tx-packets
>                          0       0       69      0       0       0       
> 0 10032           69
> 
> 
> 
> Mihai


