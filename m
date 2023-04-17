Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF79C77B76
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 14:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upv98KGWWlfGoHpKOv+OsovDaaCthAprOC3CatQntsk=; b=pwq0zP1ab92B2+
	Z/BDsRMrheAeo0kUmymTAO73S7sd8JD0PaL4YP+5RP/aN5gHEQJCF/uI9xKKzfGAHcX0oA+iqc9p4
	XaGJfRnIEcgkJOXyo7odE1qAVSXeO5eRU3BjKDtk8QqrnZfpzSlOHwvJslDhh9I4qc9fvXnwsX2iy
	Hmu+4TH7xhPTUCOaTsgN4PdozFeknS02Sco9ATk6zhO2YoRf2Pu2dHSVBVTzoF3Af2SGBhzb3vk5E
	W7xy/A6W9gXhULhfLCazL6MXtU0++NfLbZ3EFa0qTOu2VpUyxt0QlxsJ30ij6w2y6VkKKaAH80VfP
	NIJ70u0p00J7pezBTa8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPWO-00GXLP-0q;
	Mon, 17 Apr 2023 14:07:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPWK-00GXJT-0U
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 14:07:55 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33HDSied003998;
	Mon, 17 Apr 2023 14:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=c/R4YruE4tvVGWHKp8wzCxR6bWK/oJX90T/kObXm1S0=;
 b=Q4DoVIue2pv1/hZHljSgAjSd5MM0EgpuwbXmxX5iBgAWCpr5WDE4c8VtL6z5CgFjvgss
 orNJ8pzlueXwvBwGqJEj4JwQaYoo4lQom9lft9d5deta2kB4rungWx/cCxHuOLJNzHii
 F+cM0trUpHWZ/hydsrV92tzzQQ5heQBcub7T/64rGDbBy0RsbF+L67K2fR32SZEuL81T
 i54tNuqKZbeDP6/G2JbLSg0vVyT4bnt6+B46rHBAmQnGQZprZSwjN+sszuEVgZNc8/R8
 GPMA4hWiOtuSIJcf/772X8strkV+t3LDmAHziaiqKAigt3F23amD/QnLJhx4CIV15Jv4 6Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q171gg2s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 14:07:49 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33HE7mWI030516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 14:07:48 GMT
Received: from [10.253.75.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 17 Apr
 2023 07:07:47 -0700
Message-ID: <edfc26b5-f6d1-2ab7-f3cc-60a74c8c334d@quicinc.com>
Date: Mon, 17 Apr 2023 22:07:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
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
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <91577d586475d290e08dee9e535cb6b4896e06d4.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VJe_swdghrZ5c4WbHUCgXltm8cVK_3pb
X-Proofpoint-ORIG-GUID: VJe_swdghrZ5c4WbHUCgXltm8cVK_3pb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_08,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=680 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304170126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_070752_374709_6FE126E2 
X-CRM114-Status: GOOD (  14.98  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

T24gNC8xMS8yMDIzIDM6MzIgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVHVlLCAyMDIz
LTA0LTA0IGF0IDEwOjU0ICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gT24gMTAvMTEvMjAyMiAz
OjI2IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+Pj4gT24gVHVlLCAyMDIyLTEwLTExIGF0IDEy
OjA3ICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4+PiBPbiA5LzI4LzIwMjIgMTE6MjggUE0sIEpv
aGFubmVzIEJlcmcgd3JvdGU6Cj4+Pj4gLi4uCj4+Pj4+PiBNYXkgSSBrbm93IHNvbWUgbW9yZSBp
bmZvL3N0YXR1cyBhYm91dCB0aGUgImluY29taW5nwqAgbmV3IG1ldGhvZCB0byBsZXQKPj4+Pj4+
IGRyaXZlcnMgc2V0IHRoZSBsaW5rIGFkZHJlc3MiPwo+Pj4+Pj4KPj4+Pj4gSSB3YXNuJ3QgYWN0
dWFsbHkgcGxhbm5pbmcgdG8gd29yayBvbiB0aGF0IG15c2VsZiwgRldJVy4KPj4+Pj4KPj4+Pj4g
am9oYW5uZXMKPj4+PiBPSy4gU28gaGFzIHNvbWUgYm9keSB3aWxsIHdvcmsgZm9yIHRoYXQgbm93
P/CfmIEKPj4+Pgo+Pj4gWWVzLCBJIGRvbid0IHBlcnNvbmFsbHkgaGF2ZSBhIG5lZWQgZm9yIGFu
eXRoaW5nIG90aGVyIHRoYW4gd2hhdCB3ZSBoYXZlCj4+PiByaWdodCBub3cuCj4+IE1heSBJIGFk
ZCBtZXRob2QgdG8gbGV0IGxvdy1kcml2ZXJzIHNldCB0aGUgcHJpbWF5IGxpbmsgYWRkcmVzcyBs
aWtlIGJlbG93Pwo+PiBJIGFkZCBhIGZpZWxkIGluIHN0cnVjdCB3aXBoeV9pZnR5cGVfZXh0X2Nh
cGFiLCBpZiBpdCBpcyB2YWxpZCwgdGhlbiBpdAo+PiB3aWxsIGJlIHVzZWQgYXMKPj4KPj4gbG9j
YWwgcHJpbWFyeS9hc3NvYyBsaW5rIGFkZHIgaW4gZnVuY3Rpb24gaWVlZTgwMjExX21nZF9zZXR1
cF9saW5rKCkgZm9yCj4+IHN0YXRpb24uCj4+Cj4gSSBkb24ndCByZWFsbHkgdGhpbmsgdGhhdCBp
dCBtYWtlcyBzZW5zZSB0byBwdXNoIHRoaXMgdG8gY2ZnODAyMTEgd2hlbgo+IHdlIG9ubHkgbmVl
ZCBpdCBpbiBtYWM4MDIxMT8KPgo+IGpvaGFubmVzCk9LLiBTbyBJIHdpbGwgdHJ5IHRvIHB1dCB0
aGlzIGluIG1hYzgwMjExIGxheWVyLCBpcyBpdCBPSz8KCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
