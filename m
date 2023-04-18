Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9F3C77B75
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HIX17AA1NMdH4mO2jZ7IWs1fsl7ub4vXxeqA+Ok07q4=; b=Njj8VLjARCIw18
	WIPcU50pq964iKpKfoDI2dErz0ubJh9qpDN5cdUrLKLl0nN521gjjaGkgPN9bwVSA5r1JSfaR2E1y
	Zzq33n69XV/xFrIcephwyEdoqM1VXgoHafZObySb4jXEHQi91gI/kZOL7XqOOz8SH58/54OdwaOuh
	j9XmsdOXGLUHzS8utTXgO1oZr/2LvljKpM0RQd9Vu1MzeOaQ3q8dOPxEPX36LGFCKJoxE/FynsUI9
	tsSx6fBuYMBPpLK+rO+/HKPQm0AQ7UEGyoSFecjkxvEYFsQ5zFxlY/TrB2WD3oZHfoCrBxMqeK3q7
	GNjcfuRHS9GBa7rRf1RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohmL-001VG5-17;
	Tue, 18 Apr 2023 09:37:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohmH-001VF1-2Q
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:37:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33I9KVSj010503;
	Tue, 18 Apr 2023 09:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JGoZyb3Bl2kzdFe8/kjBkjoXn1iM36EmmSgf6udDhDY=;
 b=m8gH74oz8Jb5Kmqw2hU86SdVlMYYu8n4kIc3B/LPU3QotIJ9h4NSlY3p43R+opLi367h
 k2Fcc9pmbRbBbyhK87eClGYDhy2+qDuUlJd2819DunM/xLeCyKevvdW9bZc7j1W8qSgW
 0viExvn3CpRrETEDSx9OVcQG1/3+1FfGPTWmn6h8K1BZldWOVTKudXArsqmr+OHWXwHE
 rm2BYgio/KVzQv8SFmjcLUBCBXIlTdFXHm9W3E+uEJG/z1G8kyau08wP/rZ4W4Bb/5SR
 oe6optdtHRJRjfvXMRr2SdanGN7LGEJYQS6sGgFAAY2imb2Q8nkpwJVQy77mI91CJKgx yw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q12utayd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:37:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33I9bW9X003875
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:37:32 GMT
Received: from [10.253.75.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 02:37:31 -0700
Message-ID: <13980456-11a6-384c-7be2-63c005410267@quicinc.com>
Date: Tue, 18 Apr 2023 17:37:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <c05780bc-864c-9323-499d-a8b1ba1c2ef2@quicinc.com>
 <545227cf18baac94ea8aa24dc08b250c47949541.camel@sipsolutions.net>
 <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
 <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
 <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
 <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
 <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
 <b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com>
 <91577d586475d290e08dee9e535cb6b4896e06d4.camel@sipsolutions.net>
 <edfc26b5-f6d1-2ab7-f3cc-60a74c8c334d@quicinc.com>
 <61268d31f8a6dd4eea10fcb6048d39244bc584e2.camel@sipsolutions.net>
 <870ce439-85b1-f02c-70e5-2d424fd73372@quicinc.com>
 <34ed0938b69ead648da1aa250a2e081054fb49d4.camel@sipsolutions.net>
 <34212873-0b71-7f39-b064-6b50d8e514b4@quicinc.com>
 <09b156b1ef05377ca7fa0db35e8e13beb5c60e2c.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <09b156b1ef05377ca7fa0db35e8e13beb5c60e2c.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cvxu9Q3TRFSYcn9yB3ViUWm7cw47ADof
X-Proofpoint-ORIG-GUID: Cvxu9Q3TRFSYcn9yB3ViUWm7cw47ADof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_05,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 priorityscore=1501 mlxlogscore=587 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_023733_797560_B2E527B8 
X-CRM114-Status: GOOD (  17.02  )
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

On 4/18/2023 5:31 PM, Johannes Berg wrote:
> On Tue, 2023-04-18 at 17:22 +0800, Wen Gong wrote:
>> It should work, I will test it later.
>>
>> For the 1st assoc link, the data->u.mgd.assoc_data is empty in
>> ieee80211_mgd_setup_link(),
> Yeah for the first link it should work.
>
>> because ieee80211_mgd_setup_link() is called from nl80211_authenticate()
>> for the 1st assoc link.
>>
>> So ieee80211_mgd_setup_link() use eth_random_addr() for the 1st assoc link.
> Right.
>
>> For the 2nd link, ieee80211_mgd_setup_link() is called from
>> nl80211_associate()
> I don't think so, it should only be called from
> ieee80211_assoc_success()?
Yes, I checked again, you are right. It is not from nl80211_associate().
>> the sdata->u.mgd.assoc_data is NOT empty,
>>
>> and the sdata->u.mgd.assoc_data->link[link_id].addr is valid,
>>
>> it is addr by eth_random_addr(assoc_data->link[i].addr) in
>> ieee80211_mgd_assoc().
>>
> Exactly, so we've already decided on the address long before we actually
> add the link data structure, so your callback would be much too late.
> We'd need to have it called from ieee80211_mgd_assoc() already?

For the 2nd link, is it OK for me to use the random addr which is set in 
ieee80211_mgd_assoc().

I only need to set the 1st assoc link in low driver.

> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
