Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E209D4923C
	for <ath11k@archiver.kernel.org>; Mon, 18 Nov 2024 15:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:CC:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t7ZSWrSrcg5o61XWcz8hWD8eaRzY8YGThlUqTefC6aU=; b=o3DSPp7tx8c3/YjdyWNHiKMNbS
	Xaa2g34XeOr8Ev/dyzmZcsqSeQHCLbT3U+DPZ4nO3BScH/bBpui1V+vpRu12qx3j4tFw7Y0QCt8ib
	slrQQTJLbifQUe5QCBn9XenaImAZXpgm/W4mAbpRyiFpOAdfg7cLb/8HVwMCxul02MZ5/AADmA6Rv
	WFcHV8yScmdGc6dj2p+o+IA08cqi3Th91Dnjp6iSkZGuAjEgyCLTn8o2Uic1nkwOvYp8ih+z5E+4E
	SiGfnjswu7V7spodaJ3D92b5oZy99zb38bnJdPe2z+itOKSzeDEKV7L/MdFOpC8X/BTgQ+pD1w/tk
	UWZZh2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD43Y-00000009yWK-10gt;
	Mon, 18 Nov 2024 15:52:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD43V-00000009yVM-1M2M
	for ath11k@lists.infradead.org;
	Mon, 18 Nov 2024 15:52:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIECvcj004229;
	Mon, 18 Nov 2024 15:52:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t7ZSWrSrcg5o61XWcz8hWD8eaRzY8YGThlUqTefC6aU=; b=ozwjawsdpU2wVwYP
	O/IKlnVXmrM+rPqTaBeEUSijFAtgv7OjBqrzIXRZnKzS6/4NmkT/2acw0jNQSyh/
	1OuFoKg3KYhI95LXUnZDNMkuVNK3KF/d+ErmfvAmSy4aYmV/W0GxzbsTzeWu62On
	C0ksnL7PEuye5x0LzZuAkS/DTV027O6OoNIFX7AJo82ZhnO1Z2uDFQIygv4F0iws
	ZXqPdwtrqZZZpoNKpe077AAXDVkUoRO5XngVry7y+6chSBH63W4Ye8Ad0zbVzRfQ
	bhZV4kmZkqtvK7ustdq5S4/86GG0VcL8pu3addgtGhEVIxGSSthHuYbGAzz6sKRV
	7ZnnJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xm5g5343-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 15:52:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AIFqhtP024988
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 15:52:43 GMT
Received: from [10.111.176.82] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 18 Nov
 2024 07:52:43 -0800
Message-ID: <6b9c0664-f58a-4978-a371-741c6e6eb133@quicinc.com>
Date: Mon, 18 Nov 2024 07:52:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] [PATCH 00/13] ath1{1,2}k: support multiple PCI devices in
 one system
To: Mihai Moldovan <ionic@ionic.de>, <ath11k@lists.infradead.org>
References: <cover.1731858971.git.ionic@ionic.de>
 <4c5a9c95-13a3-440a-9947-a11209876c0b@ionic.de>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
CC: linux-wireless <linux-wireless@vger.kernel.org>
In-Reply-To: <4c5a9c95-13a3-440a-9947-a11209876c0b@ionic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hwWyFJ6YAI5nTb7wKLYHYGciDitBxP15
X-Proofpoint-ORIG-GUID: hwWyFJ6YAI5nTb7wKLYHYGciDitBxP15
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=706 phishscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411180132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_075249_371704_72382D54 
X-CRM114-Status: GOOD (  12.85  )
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

On 11/17/2024 8:59 AM, Mihai Moldovan wrote:
> Just some spelling fixes I'll stage for a v2, since mistakes naturally only 
> become obvious after reading what was sent out...
> 
> 
> * On 11/17/24 17:05, Mihai Moldovan wrote:
>> [...]
>> socket and bound to for client sockets, which will automatically filter
>> messages from other endpoints and also make sure that messages clients
>> send are routed to the correct endpoint.
> 
> [...] and also make sure that client messages are routed to the correct endpoint.
> 
> 
>> [...]
>> and additionally new API is introduced so that other parts in the kernel
>> can either get an endpoint ID for given endpoint-specific data or even
>> register endpoint-specific with a new endpoint ID that is generated by
>> the QRTR driver. [...]
> 
> [...] or even attach endpoint-specific data to a new endpoint ID generated by 
> the QRTR driver.
> 
> 
> 
> Mihai

When you post v2, please use scripts/get_maintainer.pl to identify all of the
maintainers and mailing lists that should be notified of this RFC.

I suspect you won't get much feedback without doing so.

/jeff

