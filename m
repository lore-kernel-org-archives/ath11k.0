Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57501E77180
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKRHSSkFO/9qxXnX4VdFN+ENGR4IipewyVU2OtOSgwE=; b=DvPdMUaZ5Pp/uhL90YyanNV7PQ
	gHSc5+Psxc4s1HujTD/ECGNwXmIKximVJTWGXHt8mrDNjwZfxZNtMle2dZ5PdoB6KcGkgJNOEgIJm
	MM9NSnBjDT2PTyMhyMHoA6C2eW6UgSqZOtYJ/w+IO2jly7OpzUX373S4dCD5uRQ1bS0Ivl+iiFpAH
	Y0hcgJl7Yd8Y6dCK0BOXo1VFfw84ejhoMMAznzuEyEOaKEKOpSDJ2kEMxHvuKVdYtGV3bIAJLfncd
	huiPW8WtLAi+fW25bBhg+bwbkK0S7VImJx5t4WZDZeLtBhShQEmJtq1iSBdWdJrUmAid+L1m/5fql
	KaZr648A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofQ-00000001aFo-49ZK;
	Thu, 12 Dec 2024 19:16:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnbm-00000001Kgd-3Evc
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 18:08:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7qAOE032186;
	Thu, 12 Dec 2024 18:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cKRHSSkFO/9qxXnX4VdFN+ENGR4IipewyVU2OtOSgwE=; b=pwkZGxdzRXJ2Gniw
	egccIPPzOALI1zJcCjw5zl0F7E4zSWN7FXq6aBopmGg2igmA1nQEXl0TTn8NzO+u
	5O75YYwy2FbnCHyPjFzFlZ15611kxQfrfwXQDFnmkRdLmUahptn5OJeOSuG1MYp5
	qvF77DYJbYa6psPR8h0a+nHNOZM8DdNXL014A2275bagC+eElqhsb2PR4AVwvoGC
	uQJnmAxN5wNbCoiAGuj9Tuf2feVtgxrptgmDEvWngD26TyoNN9MVRQ4Xsg4975WD
	OTQuLayy4DOIhXVKWA+5OWfgQ6GC0yU9ac5WtsMbzTFZFNswirZuphDKeEr0Pa+O
	BvcHNg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfd390-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 18:08:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCI8Caa025893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 18:08:12 GMT
Received: from [10.111.178.2] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 12 Dec
 2024 10:08:11 -0800
Message-ID: <ecbd70dd-9274-42b6-9673-9c6d82c4e763@quicinc.com>
Date: Thu, 12 Dec 2024 10:08:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k swiotlb buffer is full (on IMX8M with 4GiB DRAM)
To: Christoph Hellwig <hch@lst.de>, Baochen Qiang <quic_bqiang@quicinc.com>
CC: Robin Murphy <robin.murphy@arm.com>, Tim Harvey <tharvey@gateworks.com>,
        <ath11k@lists.infradead.org>,
        linux-wireless
	<linux-wireless@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        "Marek
 Szyprowski" <m.szyprowski@samsung.com>,
        <iommu@lists.linux.dev>
References: <0282be95-9094-4d49-b79e-4f7c976dad00@quicinc.com>
 <CAJ+vNU32EMHjtchJRb1sODBrUKG2vZW4ZEu1_F0+dCCEjCn7Dg@mail.gmail.com>
 <20241209081714.GA25363@lst.de>
 <593c0d63-d8fd-4439-a57a-97340212c197@arm.com>
 <CAJ+vNU2ypE_Mn_6iKCmf5LYk9Sth=ryWXyewc5MhOKK8VoAKCA@mail.gmail.com>
 <20241210041133.GA17116@lst.de>
 <CAJ+vNU03Cqsc+O5anwmvJW8Wfd-06LbDMVHjxVFdixf01ZLczQ@mail.gmail.com>
 <5fe372df-ae51-4a8b-9fa3-a4a0ea2d33e3@quicinc.com>
 <9b2e8ffa-ba2c-46da-a478-eb1fb44b693e@arm.com>
 <80992ae5-e329-4a34-94c8-9345b2e8a9a0@quicinc.com>
 <20241212071848.GB6638@lst.de>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241212071848.GB6638@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PhVrHVHMthQseaX3U30Djw5Jr8uC55Ie
X-Proofpoint-ORIG-GUID: PhVrHVHMthQseaX3U30Djw5Jr8uC55Ie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=924 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100818_854319_CA08641A 
X-CRM114-Status: GOOD (  12.93  )
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

On 12/11/2024 11:18 PM, Christoph Hellwig wrote:
> On Thu, Dec 12, 2024 at 01:24:45PM +0800, Baochen Qiang wrote:
>> yeah, you are right, Robin. didn't know there are convenient interfaces
>> like these already.
> 
> FYI, the DMA-API documentation says pretty straight forward to not
> use the streaming API and documents these interfaces.  But maybe it's
> not clear enough, so I'm open to suggestions on how to make it more
> obvious.

This is probably less of a documentation issue and more of an issue with the
fact that each instance of the ath driver is based upon the prior instance,
and hence it inherits any usage of legacy APIs. So unless someone notices
there is a better API, or proactively adds the usage of the new API for us,
the ath drivers will continue to use legacy APIs.

So it is appreciated that light has been shed on this issue.

/jeff


