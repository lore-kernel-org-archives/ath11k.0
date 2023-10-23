Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8F9C004C0
	for <ath11k@archiver.kernel.org>; Mon, 23 Oct 2023 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MG/UNiz+ehs4vm/CxMq+6IrZVoHQf+ZQOEGe/AiHF+Q=; b=RlDvFY2nXmJtj92FM78dIOr6Jd
	YzqrufdpZBbSr1+o39Xw9Shgc4lN1YsRPlKhvDHUCKdVDu8Jb8F1ouqVstXLrm7zDYJ7Vejw23lyz
	eQ6ycRuor9WcmW0By00wVIhCwAsKiI9P+xS1f1pzohXh/yogNjMPPbgvSoakhrkt9qWI+VhytwD2V
	uqVp5RSM6lJ8hOlyVi0fTaOwLPnY0xmyE7VCaBhQ9MjPKDQC8/cMHlRnDVyM/NRc3Tqnlu7pkX/A0
	XPnv9NiHztj/i4vwtyqOZPXn0fgQoCPWJ+j0hER567svTTk5A00lAbszICmBfqaJ+JFIiEuRxIDEN
	DcKSQPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quwhQ-007fgo-20;
	Mon, 23 Oct 2023 15:18:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quwhN-007ffZ-1G
	for ath11k@lists.infradead.org;
	Mon, 23 Oct 2023 15:18:34 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39NFIClB032285;
	Mon, 23 Oct 2023 15:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7D9BryH7owaHHM179wUdE5hXmh50LiaW3FghIKZQUIE=;
 b=NJNgg8COpAA6n28pbxN+5olyfL+3BzS/ASm5NTQ9pCLqxR5Fa0cSWZJPvjKysnvJ8Ggu
 onYJmlTwGT2xmTK1lGLdcuOw+7xRz39CLp9xQVbTc1T7A3P/I9NyxpSqjdoYolYYMzYx
 OJnDNPfq5IDYO968sr7EgSucTEBUDbAaA8CX2d0vmUjLLJFOvPhYBJpl3R65w2XecQF7
 2f79nxEr0sui1r6of4CdKMLf8BndJfHQPsWy1pvhhrJOmlqVY1hXXF2CFHBRWHXd6W4Q
 nOX35uyxTD5jIOd2RrKV3NyKybhW/fjXeYIDsLxqPIIyqWs3DHAjRtoPV+gRFCgP/NGr MQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tv40umk57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Oct 2023 15:18:26 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39NFIP4a003936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Oct 2023 15:18:25 GMT
Received: from [10.110.58.208] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 23 Oct
 2023 08:18:24 -0700
Message-ID: <7fe2972e-81fd-551e-4b61-ea804c60b0fd@quicinc.com>
Date: Mon, 23 Oct 2023 08:18:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: QCA6390 hw2.0: firmware crashing on ath.git master branch
To: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>
References: <87edhu3550.fsf@kernel.org> <87o7gpz9ti.fsf@kernel.org>
Content-Language: en-US
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <87o7gpz9ti.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MJc4KwuG3V235NTcwMz4yZ2DaKmkpqDc
X-Proofpoint-ORIG-GUID: MJc4KwuG3V235NTcwMz4yZ2DaKmkpqDc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_13,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=567
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310230133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_081833_576188_EE30AA25 
X-CRM114-Status: GOOD (  14.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/23/2023 7:34 AM, Kalle Valo wrote:
> + aloka
> 
> Kalle Valo <kvalo@kernel.org> writes:
> 
> I found a reliable way to reproduce the firmware crash. I connect to my
> home network, then do 'sudo service connman stop' and boom, the firmware
> has crashed. I suspect it has nothing to do with connman, most likely a
> simple disconnect will suffice but I didn't bother to test that.
> 
> I did a git bisect and it points to Aloka's recent commit. Luckily the
> commit is only in ath-next so far and not in any release. My plan is to
> submit a revert by tomorrow so that we get this fixed before pulling
> ath-next into wireless-next.
> 
> e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
> commit e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
> Author:     Aloka Dixit <quic_alokad@quicinc.com>
> AuthorDate: Mon Oct 9 10:13:54 2023 +0300
> Commit:     Kalle Valo <quic_kvalo@quicinc.com>
> CommitDate: Tue Oct 10 10:23:02 2023 +0300
> 
>      wifi: ath11k: call ath11k_mac_fils_discovery() without condition
> 

Oh, I'm so sorry about that.
Please revert the commit, I will check what is happening and get back.
You haven't faced this issue with the same change in ath12k right?
Thanks.


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
