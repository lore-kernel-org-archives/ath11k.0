Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39996C32771
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xd/VHnPwjH0vdYU7S5VQFAGXc4s51tBEBXceNbc413E=; b=UtWLQb5jrI+MhB
	RBmehB+P6zmDREcx1jLj72EU00q40oNyrQeCWdIk+X83eCam7p1hU6u3Jlw+GmEVzW8CpcWIjd7Km
	SdhaeAkVNw4FUdtfsHCOEtAjfs4Jnk6eODIZ2x9k8zVq6zfalA16GUdV3AAEWse9ruHJraEEaAZlN
	zPnZyEAn/o1DiE88rNgbCLRNtFG3OcIIa2DouxSlmmGezjFomg5l3n9z/VcmLYoQAuSmiH1hFc9/e
	NQ9Nz2OnzfWz1ca5vVBeFiQF8h99qvR7F6wFEfh4C0heYyGnd0Th1n1u6PLdydf4oCHa70DbGpY6D
	CV+oAVsDvidvcgWxbXgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYrt-00GsFZ-Hj; Wed, 28 Sep 2022 15:21:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYrq-00GsEa-F9
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 15:21:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28SEwopR015785;
	Wed, 28 Sep 2022 15:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lWXuHUpCAO4ShSVsUvTBOVhHkvv1Cv4qu1WFDI62iFs=;
 b=EpbB3WWMDmoHlWaOldSTNjOgekXH47FUbAn9yUXiasoxI25xaEm+oMi7wfP8p3rpkz8f
 mrPR/bw0ztwusW+MBtzzIWkBmFQA00bJP/taYLJprmm5tY8hvIObBxW5FxVtCEmfppSB
 pV8V//F8mShIo9ocGFuerul46PGL8QwYhTcTuG1NzVZRc5/2h0Ue6bAnPY55JJmuO0qK
 sGBJClORxAft95/iJP+gOctW4xRYV4jE8K8jyFb0HVm6iMstWCFFQ3hHX7BT2+p25cEX
 8JMDtDLD5alQ8ghi5CUHpiRGCLB6OJbWncInp0WWxWeHPMH8nRdJECrEfAEZsE0g6IhW Uw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3juvnnm46d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:20:56 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28SFKtfD020634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Sep 2022 15:20:55 GMT
Received: from [10.253.33.95] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 28 Sep
 2022 08:20:54 -0700
Message-ID: <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
Date: Wed, 28 Sep 2022 23:20:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
From: Wen Gong <quic_wgong@quicinc.com>
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
In-Reply-To: <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VfEMD4drWKJD2-sx4Earv5sdGyHOxQTq
X-Proofpoint-GUID: VfEMD4drWKJD2-sx4Earv5sdGyHOxQTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_06,2022-09-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=983 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209280090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_082058_640168_F072A4D7 
X-CRM114-Status: GOOD (  19.74  )
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

SGkgam9oYW5uZXMsCgpNYXkgSSBrbm93IHNvbWUgbW9yZSBpbmZvL3N0YXR1cyBhYm91dCB0aGUg
ImluY29taW5nwqAgbmV3IG1ldGhvZCB0byBsZXQgCmRyaXZlcnMgc2V0IHRoZSBsaW5rIGFkZHJl
c3MiPwoKT24gOS85LzIwMjIgNDo1OCBQTSwgV2VuIEdvbmcgd3JvdGU6Cj4gT24gOS85LzIwMjIg
MzoyOCBQTSwgSm9oYW5uZXMgQmVyZyB3cm90ZToKPgouLi4KPj4gSWYgd2UganVzdCBjaGFuZ2Ug
dGhlIGZpcnN0IGxpbmsncyBhZGRyZXNzIHRvIHRoZSBzYW1lIGFzIHRoZSBNTEQKPj4gYWRkcmVz
cyB3aXRob3V0IGFueSBjaGFuZ2VzIHRoZW4gdGhlIGNvZGUgd2l0aG91dCB0aGUgY2hhbmdlcyBi
ZWxvdwo+PiB3b3VsZCBvdmVyd3JpdGUgdGhlIGxpbmsgSUQgYmVjYXVzZSBpdCBjYW4gZmluZCB0
aGUgbGluayBTVEEgYWRkcmVzcywKPj4gZXZlbiBpZiB0aGUgZGV2aWNlIGFscmVhZHkgZGlkIGFk
ZHJlc3MgdHJhbnNsYXRpb24uIE9mIGNvdXJzZSB0aGlzIGlzCj4+IG9ubHkgcmVsZXZhbnQgaWYg
aXQgZG9lcyBhZGRyZXNzIHRyYW5zbGF0aW9uIHcvbyBpbmRpY2F0aW5nIHRoZSBsaW5rLAo+PiB3
aGljaCBpdCBzaG91bGRuJ3QgLi4uIGhlbmNlIHRoZSBwYXRjaC4KPj4KPj4gSW4gYW55IGNhc2Us
IEkgZXhwZWN0IHRoaXMgd2lsbCBlbmQgdXAgYmVpbmcgc29tZSBraW5kIG9mIGRyaXZlciBwb2xp
Y3ksCj4+IHNvIEkgY2FuIGltYWdpbmUgdGhhdCB3ZSBjb3VsZCBtYWtlIGEgcmVsYXRpdmVseSBz
aW1wbGUgcGF0Y2ggd2l0aCBhIG5ldwo+PiBtZXRob2QgdG8gbGV0IGRyaXZlcnMgc2V0IHRoZSBs
aW5rIGFkZHJlc3MgdGhhdCBnZXRzIHVzZWQuIEl0IGNhbm5vdCBiZQo+PiBjaGFuZ2luZyB0aGUg
bGluayBhZGRyZXNzIHdoZW4gaXQncyBhZGRlZCB0byB0aGUgZHJpdmVyIHNpbmNlIHRoaXMgcGF0
Y2gKPj4gdGhhdCB0aGlzIHRocmVhZCBpcyBiYXNlZCBvbiBtZWFucyB0aGUgZHJpdmVyIGRvZXNu
J3QgZ2V0IHRvIGtub3cgYWJvdXQKPj4gdGhlIGxpbmtzIHVudGlsIGl0J3MgZmFyIHRvbyBsYXRl
IChhbmQgZXZlbiBiZWZvcmUgdGhpcyBwYXRjaCwgdGhlIGxpbmtzCj4+IHdlcmUgb25seSBjcmVh
dGVkIGFmdGVyIGFzc29jLCB3aGVuIHRoZSBsaW5rIGFkZHJlc3NlcyB3ZXJlIGFscmVhZHkgc2Vu
dAo+PiB0byB0aGUgQVApCj4gVGhhbmtzIGZvciB0aGUgaW5jb21pbmfCoCBuZXcgbWV0aG9kIHRv
IGxldCBkcml2ZXJzIHNldCB0aGUgbGluayBhZGRyZXNzLgo+IEl0IGlzIGJldHRlciB0byBsZXQg
ZHJpdmVyIHRvIGZpbGwgYWxsIHRoZSBsaW5rcycgYWRkcmVzcyBpbiBsb2FkIHBoYXNlLgo+IEFu
ZCB0aGVuIGl0IG5ldmVyIGNoYW5nZSBhZ2Fpbi4gQW5kIG9uZSBvZiB0aGUgYWRkcmVzcyBhcnJh
eSBpcyBhbHdheXMKPiB1c2VkIGZvciBwcmltYXJ5IGxpbmsuCj4KLi4uCgotLSAKYXRoMTFrIG1h
aWxpbmcgbGlzdAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
