Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DD9C77B71
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tKjWqaNJAGqkVCrG6SB9vXMggN61puwpoCwUlIXEVk=; b=hFa0n7PRSEGU+C
	SxT8hcjXBoCL9zuhaV6q9AHb9V37reWJ8TQ/G3qI2OWkaNbzKodOG3nYPnPqXcVMSt50DSn+gEvTO
	JETmZFzASw0vyQy/QoKcxWxkdkBbpH8MvmxYo/osDkaNSD/UX61ZME2AAEatP1jBpTTWOohT3pWwL
	WeVj6JqDAt3j71KzSxIMrqAu2tYz00pOeGDU86OpjsBhp/0eDs7vy40/KawKm8zeBCuyxRZM8shLE
	1715O3X7hRAvi6Wy0wmBpUSSFJHW+T7WOFNh2rp31oSQ94hr/hfRcPhVkFceF1fCMqFWp2UTEGulc
	H+UmimwkkxwaVNL+s4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohYL-001S1m-2W;
	Tue, 18 Apr 2023 09:23:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohYJ-001S12-0a
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 09:23:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33I6shVU013686;
	Tue, 18 Apr 2023 09:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CFKMog9VfifSKbI/2CCxEKPCJcaOephdmWExTfF61qY=;
 b=nZgHLqy+f5OQW8Vmrq/ZgZ8BCdhAGKE2lxsSFFLtAaBEBwfnWlcv3x9yVTeCTSSs+wTB
 s0acFzJb30QyiXmCdLtsP2K9urf6i8vYF1CStqqKCS/DWjLQga9kmCZHWIIu3R2syb/p
 ThoVCRaGgUx5Bu3M7pOWraAzdyhhE+E1gzXCEh2x3UXacsTGHtHiUqmcMkEP2/73LIXE
 W5VxT1aWD6QpjXg3usAgiPE+glFVeyHP3E1xULRtUbF6f6MC9kOqlaN8zznD7f0IDhe1
 BeAfnvH3H1r8wwNPzmlasQdeJhhsk2wnxOOJY8P5VdN27fLzLsfPvZ3oy8gG4S4orann 3w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q17yht6da-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:23:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33I9N1iR017827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Apr 2023 09:23:01 GMT
Received: from [10.253.75.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 18 Apr
 2023 02:22:59 -0700
Message-ID: <34212873-0b71-7f39-b064-6b50d8e514b4@quicinc.com>
Date: Tue, 18 Apr 2023 17:22:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <2de44394-cb93-7be4-481f-2d92788b8d28@quicinc.com>
 <351f74e0e1cd6e9724f97dbd042bdc5e04c44842.camel@sipsolutions.net>
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
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <34ed0938b69ead648da1aa250a2e081054fb49d4.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WmMXVbskVZPPA2lZNdBAd1ET_aMA5vcl
X-Proofpoint-GUID: WmMXVbskVZPPA2lZNdBAd1ET_aMA5vcl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_05,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxlogscore=921
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_022307_334319_28744FC3 
X-CRM114-Status: GOOD (  20.38  )
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

On 4/18/2023 5:11 PM, Johannes Berg wrote:
> On Tue, 2023-04-18 at 16:59 +0800, Wen Gong wrote:
>> On 4/18/2023 4:15 PM, Johannes Berg wrote:
>>> On Mon, 2023-04-17 at 22:07 +0800, Wen Gong wrote:
>>>> OK. So I will try to put this in mac80211 layer, is it OK?
>>>>
>>> I guess? I'm still not really sure why you even want it, but hey, that's
>>> up to you in a way. I really didn't like the suggestion with
>>> wiphy_iftype_ext_capab (or any other capability for that matter), it
>>> feels like it should be more dynamic, like maybe a new "add link"
>>> callback or something? At least then you can't blame mac80211 for when
>>> it breaks when you have two 5 GHz links ...
>> ok, so I would like to add callback such as
>>
>> "add_link(struct ieee80211_hw *hw, struct ieee80211_vif vif, struct
>> ieee80211_bss_conf *link_conf, unsigned int link_id)"
>>
>> in struct ieee80211_ops, and mac80211 call it in
>> ieee80211_mgd_setup_link()/ieee80211_vif_update_links,
>>
>> then lower-drvier could dynamic set the local addr of assoc
>> link_conf(also for 2nd link_conf), is it OK?
>>
> Seems OK, but I'm not sure that _works_?
>
> After all, we first set the addresses in assoc_data, when we don't have
> a link_conf yet, no? Just what we were discussing in the other thread
> about the leak.
>
> johannes

It should work, I will test it later.

For the 1st assoc link, the data->u.mgd.assoc_data is empty in 
ieee80211_mgd_setup_link(),

because ieee80211_mgd_setup_link() is called from nl80211_authenticate() 
for the 1st assoc link.

So ieee80211_mgd_setup_link() use eth_random_addr() for the 1st assoc link.


For the 2nd link, ieee80211_mgd_setup_link() is called from 
nl80211_associate(),

the sdata->u.mgd.assoc_data is NOT empty,

and the sdata->u.mgd.assoc_data->link[link_id].addr is valid,

it is addr by eth_random_addr(assoc_data->link[i].addr) in 
ieee80211_mgd_assoc().


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
