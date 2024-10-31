Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2A5D767D8
	for <ath11k@archiver.kernel.org>; Thu, 31 Oct 2024 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYlapENDF1j8UTd/5acSe3S91MtKkb9VHJSA6S4hkxE=; b=d39fzODk4gB9kIzCjHWC54vecL
	BENXIaCdkb+LF/ENZdVkJTHsnWB+mPyb4cpeLRUqOLa0ekBG6ifxuD9o+XtStH9+KP+/K3ip05Eif
	xbcQxbMlEAP8srUAo1BzaRTwPhcFgEX+fS9qFG37Xayk7FkQGpkM3OFWNhTAvFiqMpNFr4RKplR0Q
	EFnoMRUJi0AHtTM1tdWGruRUIjjsukQ6qoZO4chmj9N//7CcogYEBjJ3G+44T+dfOhS6mpD7Ha9jE
	5i/WNYiFzLlSdEUkSUxAkQam8GSO43WGU9rjJv1dmT8Mkn1a34oHV9Rv5WEm7IM0ODIAwjrC2bqDr
	sTpHGFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WUM-00000003sDi-2xAh;
	Thu, 31 Oct 2024 14:49:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WUJ-00000003sCe-109C
	for ath11k@lists.infradead.org;
	Thu, 31 Oct 2024 14:49:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49V989VE006638;
	Thu, 31 Oct 2024 14:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYlapENDF1j8UTd/5acSe3S91MtKkb9VHJSA6S4hkxE=; b=GeyLwV6a53qqseFq
	Y35le0I/Rxsec+o02u0LTE9fTxXYvo4VHLV16j81bUndgq/70RBbc4yDGU7W+lbp
	CwkglkoTrvIQDv5s9xW4CgY0BGROnk22YPCIDotZAjGNotFVIlA2gp+/HLN78ZSf
	mLGE/Et1MH9EMdEB+pfr9lG/b3xgSOk2Kbja5pb8KWyZc+EaxQqZLYTnRvbctNPu
	0R92hG7sTZn4HyXUsUlKw9XhdOJ3EI3qPJ5QYl5FpNuqeSXXk3Xca/kqJ3lrH+zl
	AqCF18DnYdklzzAf7eHC6nXHL0ioRSk8ZuhT67Q6KP9llBQfMj4uXCOGx7iAi97O
	oG3oAA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ku65au1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 14:49:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49VEnLch003677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 31 Oct 2024 14:49:21 GMT
Received: from [10.48.242.225] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 31 Oct
 2024 07:49:21 -0700
Message-ID: <ceaab3b3-6537-4ea4-bc66-1ee8c48da16a@quicinc.com>
Date: Thu, 31 Oct 2024 07:49:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: State of multiple PCI(e) modules since 2022
To: Mihai Moldovan <ionic@ionic.de>, <ath11k@lists.infradead.org>
References: <588735d6-d30d-4d9c-ba43-6a10d85786d8@ionic.de>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <588735d6-d30d-4d9c-ba43-6a10d85786d8@ionic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NcR3Fs88SUGtLZEzanwZa3YNmqmyy-vn
X-Proofpoint-ORIG-GUID: NcR3Fs88SUGtLZEzanwZa3YNmqmyy-vn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=695
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1011
 malwarescore=0 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410310112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_074927_505456_32927854 
X-CRM114-Status: GOOD (  11.64  )
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

On 10/27/2024 7:11 AM, Mihai Moldovan wrote:
[lots of very good background material omitted]
> I'll actually try to pull this patch into my kernel and also port it to ath12k 
> to see if it would work with my QCA6390 + WCN7850 combination, but even if it 
> does, it's incredibly frustrating that this issue has been known for so long, 
> users are actually looking for solutions to it and there seems to be no movement 
> on it. Even more frustrating is that inquiries regarding this are essentially 
> all but ignored.
> 
> Sorry for the rant, but I really hope that I can get some traction for this again.

Kalle & I sympathize with you. I've escalated this to my management.

/jeff

