Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633BAC77B7C
	for <ath11k@archiver.kernel.org>; Wed, 24 May 2023 07:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaVH7ifH34WXlAcbOmzxlMQsEjQHjXytRjIrwJMyH3Y=; b=Q5lvrFJOAnoHEc
	9runOaQO9h3wfilWDO7B8tX+DWSglBx0hC+cDJymDKb37qtHiUAgXyeFXz5SpXAuXVHyyrEK0/VM/
	TaZFW8g6DnQJZoEYlaM7sohT+CELwPz5dXnl4RSEYOQHYR49mrUAO68jv0mEmx5xfVhHvZatsxRJN
	UukEuSanINzKASsAQ9d+HtC5rk3V2A4xNh9S5pfMMcXkqU6xygEf4xwc7vEjfxk5bGDm3M3k1Sv78
	nC9pQQL6iDBEIGVP4WPqzM77WnbQ9OFkGNRiMsKZD/ybYzM6Pgk8BLfrjqR7YFeFgvwouWe/LRnBv
	M4FmwS1Ko0UoYsv6oz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1j5z-00CdZ2-1s;
	Wed, 24 May 2023 07:39:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1j5v-00CdYQ-2R
	for ath11k@lists.infradead.org;
	Wed, 24 May 2023 07:39:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34O5nqPc021003;
	Wed, 24 May 2023 07:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=CgT0p0n5Ta12gb6kqsmYR9CbA+Jcv69Q0WyCPyHwvjA=;
 b=kqo81PthXfN7VmabueNrjbtRzD0OO+Bo52l8OUfoEk/vP8mdd6Un8y5WVkHR8x/lexU+
 qwhVLMyJaBAIgTBDlP3HJFNSRK+1kBgFVmORnpA4baO4YtKsNdk9KZDG9tvCDymyYlu2
 Tbn7uSYZJxS2cBiLH49QDB7QJuf3JTpDiwEdHR5MWTMuVT27vORF/QrvFXbaxBredEdp
 Tvbr96uTVtdd/f2JH37eQ09s5HfEUy72XtKRg/ePF4YbCuZOal+IEkaBkGEn7UW+0KPh
 2W//CVdwGPXAbI2G/4nEz/ctm0bRNfSysjbka/Uv5TBI7tO+G9X/zjXc1i0xnVnF7q2g pQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qrsx0txfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 07:39:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34O7d59U027310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 07:39:05 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 24 May
 2023 00:39:04 -0700
Message-ID: <02c7d3f8-2486-cc59-4503-52326e12a76d@quicinc.com>
Date: Wed, 24 May 2023 15:39:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
 <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
 <113761966918b2f390d3c9304307b42a0b4a829b.camel@sipsolutions.net>
 <76863dec-1b2f-b933-7c5e-21c732de4bc6@quicinc.com>
 <2cc79101249548f2a92c14af6aff6121143907d6.camel@sipsolutions.net>
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <2cc79101249548f2a92c14af6aff6121143907d6.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b2YeXSwRSFkEW01lQ5dvifFsQERfP7B9
X-Proofpoint-GUID: b2YeXSwRSFkEW01lQ5dvifFsQERfP7B9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_03,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=940
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_003939_801947_58B4ACCA 
X-CRM114-Status: GOOD (  20.88  )
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

On 4/18/2023 5:34 PM, Johannes Berg wrote:
> On Tue, 2023-04-18 at 17:27 +0800, Wen Gong wrote:
>> Now lower driver I used do not store the key
>>
> Sure, that's fine.
>
>> and do not trigger
>> BSS_CHANGED_ASSOC for new links after assoc.
> I think you need to think hard about this ... whatever BSS_CHANGED_ASSOC
> causes is likely no longer correct in MLO. Again, the assoc state
> *itself* is only changed once, when the whole MLD associated.
>
>> So my suggestion is a way to active all links while assoc, this way is
>> simple for lower driver I used.
> Sure, and we do that.
>
> But that's not what you're asking - you're asking to re-do some *MLD*
> state when a new link is added, and I'm saying that it doesn't make
> sense to "add" (again) a key to the MLD that was already added, nor
> calling a vif (MLD!) level method saying the MLD changed state to
> associated (again).
>
> I really think you should solve this in the driver, that doesn't mean
> you have to _store_ he key, you can use one of the iteration functions
> as well.
>
>> Also ieee80211_set_active_links() is another way to active all links
>> after assoc.
>>
> Sure.

Hi Johannes,

May I add a new ops in struct ieee80211_ops? like this:


u16 active_links(struct ieee80211_hw *hw, struct ieee80211_vif vif, u16 
new_links)"

then ieee80211_set_vif_links_bitmaps() call the ops to get the links for 
station and set the sdata->vif.active_links with the return value from 
lower driver,
it means lower driver will dynamic select the links count at this moment.

If lower driver not register ops active_links, then keep current logic.
>
> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
