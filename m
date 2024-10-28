Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E31D33994
	for <ath11k@archiver.kernel.org>; Mon, 28 Oct 2024 15:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NkgN6yHum3km5DKM98053u7B7jwLeEKzV9U+VnqB+JM=; b=ASBXCxJo+hKdPLUl8ZL3rg71Bt
	vOtsKgATedsz5bWapEOvhP2CKnmrGLaGAWASWMN2zigzn0AC+enPLX0SNwn6/xYHAMI6XGP4HPq8H
	Rqr/SbztWHjkF/vyW9ewGn5dzjLTakMNohKgyvC5n1IulpLYXkMkliWC/WttY+CN52umTwlI/DM0C
	ewg9xBMyoBN8LkvaPV5W+BTsGIarvLilT2wCz1v4dnHX3Zuqu0dyYEj5wq8UNLniahM0x1Kgtpwp+
	xNf62UD0XXUfhoXG8q1eVeUP32z8Q+kz3oYR+nnyUz/ldfYIwQ33oQqxGNc6JO8zRIRKHcMUu/Hvo
	3d84NCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RHf-0000000BEaK-2Fpf;
	Mon, 28 Oct 2024 15:03:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QlL-0000000B7zG-2B2R
	for ath11k@lists.infradead.org;
	Mon, 28 Oct 2024 14:30:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SB0oqS008480;
	Mon, 28 Oct 2024 14:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NkgN6yHum3km5DKM98053u7B7jwLeEKzV9U+VnqB+JM=; b=MI6hQssPOZvmxHKT
	bdqHpZ+6NDCebKnNiGFbUIQxEYVJvnLA/vEsb1QbiBZnjVhFM3lolWIqYlw5ox36
	C5oybBH4GcGjBYu3v1Sxqynps0jYBRJw8wa7NaScRt7LGd2oK1ffFEgC4kTb8cNa
	XxgIMhRSDiauFC7E7NVJKCyKKjrtDNRs4qFJAzWIkx28lPCUPIR8mlO+xWimu0JL
	WyBie4t/tWltOoua4qMYz/dVsCvZ/6uWqGCxR2PsSqGEaXkjw+qyY40aPjzOoyZA
	ZMWWs21GaOAZ3PnY3Ixq+BWCPuJmfRUtOU/WfGA32mgS1j8eFuPImWovJMzaX5pe
	9pUvUg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gqrgn8k8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 14:30:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SEUHmw032369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 14:30:17 GMT
Received: from [10.48.242.156] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Oct
 2024 07:30:17 -0700
Message-ID: <ff8c3443-3651-480e-956e-81c7d592099d@quicinc.com>
Date: Mon, 28 Oct 2024 07:30:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ath11k: remove error checking for
 debugfs_create_file()
To: Kalle Valo <kvalo@kernel.org>, Zhen Lei <thunder.leizhen@huawei.com>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath11k@lists.infradead.org>
References: <20241025064235.382-1-thunder.leizhen@huawei.com>
 <87v7xcgwb0.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <87v7xcgwb0.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PVzzkdQOpIUoQHp8BqQ53taOHAqwAPY4
X-Proofpoint-GUID: PVzzkdQOpIUoQHp8BqQ53taOHAqwAPY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=920 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_073031_792643_6C4ED0EB 
X-CRM114-Status: GOOD (  12.64  )
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

On 10/28/2024 7:02 AM, Kalle Valo wrote:
> Zhen Lei <thunder.leizhen@huawei.com> writes:
> 
>> Driver ath11k can work fine even if the debugfs files fail to be created.
>> Therefore, the return value check of debugfs_create_file() should be
>> ignored, as it says.
>>
>> Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> 
> Are you just guessing or did you confirm on a real device that ath11k
> spectral really works without debugfs?

The debugfs_create_file() documentation tells us:
 * NOTE: it's expected that most callers should _ignore_ the errors returned
 * by this function. Other debugfs functions handle the fact that the "dentry"
 * passed to them could be an error and they don't crash in that case.
 * Drivers should generally work fine even if debugfs fails to init anyway.

The caveat is that any driver functionality that relies upon debugfs obviously
won't work if the underlying file isn't created. Hence the language that the
driver "should generally work fine" since all functionality that isn't tied to
debugfs will still be available.

Since the relayfs functionality that spectral scan uses is dependent upon
debugfs, this functionality won't work if the debugfs operation fails. So the
question is, if that fails, do you continue running the driver that generally
works fine supporting all other wifi operations, or do you return an error,
and as part of the error handling, not init the driver and hence have no wifi
operation?

The one thing I didn't check is that although the documentation tells us that
debugfs functions handle an "error" dentry, I didn't check if relayfs handles it.

/jeff

