Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3430C0032E
	for <ath11k@archiver.kernel.org>; Wed, 25 Oct 2023 22:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sERTbIEDCEO5wrwhhiwhJFiM/0FSWnyCOajd7+mpYY=; b=oxEzKkSlADMZDL
	C7Nu8Hz5IwLU4iBAUCWaHzKivY/Cn9Ap/xjEsZZcm3/eNhL3SN3srJHgteCPY9FFWMRqp/WbbX7eD
	rYB6w2gbol/sXNt08yjOw2NqjCQCt8yevA0e+/cnqE+xyVDKU1X7s9ScO+jogbtDh16qZgbZlQyGO
	MaLP1zEl16L+be1uM8Bm4kwJvgBR9gmcDbT+FicSqW/FYyNF9UMYLe6eQHlNPqDrh7szPIRC/iufZ
	rhJXS/outHekrv1ICoqegcdUQq6V0pXLp1BIe+ExNXL69O00YHh6/cwYIZ6/2qva1MAIZRm+MPC78
	5rhae/v2j1nVLQ9cRmag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvmPM-00DG1I-1S;
	Wed, 25 Oct 2023 22:31:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvmPJ-00DG0d-0b
	for ath11k@lists.infradead.org;
	Wed, 25 Oct 2023 22:31:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39PMA1np025357;
	Wed, 25 Oct 2023 22:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=X9OsyTfKKB9eJWVK5/nIT12r/uqLgwuyNyBORv02pyE=;
 b=h3nZQwRh331fC7F5HglMuSfmFWbcJMoD4+mVp+JMCavXEzbMMxpnuortD23DbW+1fb9g
 7Z0K6v6cEFlDgz4j1hfRTVGr63IqZsud2IBWHIJdWTlwp36r+djhyOLsTo6uewSANyhb
 +WuP+fWql2kpBdEwLET67LQVPr8SIvSnZ1yUuxQQkauFLUmW/cHqaJmklXRBNbmMJNSb
 Hr/9LZ9DiZLJ2wQGEIYu1PXV68hUxD5fQEr98UYTR9uJSNMyf7gm6YDxfLwro3X2BCAj
 oYB6hJwIRa+qjoeIepn9j+vlMxobQi6Y36sQCe7mEV9n6OHFr0fyYBrGhdha6XcMOeMO 7g== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3txk9kb5h8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 22:31:16 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39PMVFQq023776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Oct 2023 22:31:15 GMT
Received: from [10.227.109.178] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 25 Oct
 2023 15:31:15 -0700
Message-ID: <680da670-292c-504b-06ca-b2fecda3995b@quicinc.com>
Date: Wed, 25 Oct 2023 15:31:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath11k: QCA6390 hw2.0: firmware crashing on ath.git master branch
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>
References: <87edhu3550.fsf@kernel.org> <87o7gpz9ti.fsf@kernel.org>
 <7fe2972e-81fd-551e-4b61-ea804c60b0fd@quicinc.com>
 <87a5s9z492.fsf@kernel.org>
From: Aloka Dixit <quic_alokad@quicinc.com>
In-Reply-To: <87a5s9z492.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1ujTlwgMB_ksxTsbPvKKn6ioUkCbJOaK
X-Proofpoint-ORIG-GUID: 1ujTlwgMB_ksxTsbPvKKn6ioUkCbJOaK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_11,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=546 phishscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310250193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_153121_226185_DBEE19BF 
X-CRM114-Status: GOOD (  20.24  )
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

On 10/23/2023 9:35 AM, Kalle Valo wrote:
> Aloka Dixit <quic_alokad@quicinc.com> writes:
> 
>> On 10/23/2023 7:34 AM, Kalle Valo wrote:
>>
>>> + aloka
>>> Kalle Valo <kvalo@kernel.org> writes:
>>> I found a reliable way to reproduce the firmware crash. I connect to
>>> my
>>> home network, then do 'sudo service connman stop' and boom, the firmware
>>> has crashed. I suspect it has nothing to do with connman, most likely a
>>> simple disconnect will suffice but I didn't bother to test that.
>>> I did a git bisect and it points to Aloka's recent commit. Luckily
>>> the
>>> commit is only in ath-next so far and not in any release. My plan is to
>>> submit a revert by tomorrow so that we get this fixed before pulling
>>> ath-next into wireless-next.
>>> e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
>>> commit e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
>>> Author:     Aloka Dixit <quic_alokad@quicinc.com>
>>> AuthorDate: Mon Oct 9 10:13:54 2023 +0300
>>> Commit:     Kalle Valo <quic_kvalo@quicinc.com>
>>> CommitDate: Tue Oct 10 10:23:02 2023 +0300
>>>       wifi: ath11k: call ath11k_mac_fils_discovery() without
>>> condition
>>>
>>
>> Oh, I'm so sorry about that.
> 
> No worries, this is why we do testing :)
> 
> Once again this proves why eating your own dog food is so important[1].
> 
>> Please revert the commit, I will check what is happening and get back.
>> You haven't faced this issue with the same change in ath12k right?
> 
> My ath12k testing is still quite limited. I also didn't see this on my
> ath11k test box with WCN6855 but I haven't investigated this in detail.
> So far I have only seen this with QCA6390.
> 
> [1] https://en.wikipedia.org/wiki/Eating_your_own_dog_food
> 

I can send ath12k patch to revert that change as well until I figure out 
why it fails in ath11k. Let me know.
Thanks.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
