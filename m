Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0420BC77B76
	for <ath11k@archiver.kernel.org>; Mon, 17 Apr 2023 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3v9bdfh87DsruAzz8kc5elYnvq1Es9nL7D6TOYq5B+I=; b=aN3NfeG43vf6ps
	xpVk6euxdDHz+ZFPiH6DbU3iCJKoNe1zbEsg0fvq5m3xgKOyoZJemY4rfqUWduH2Z9j+5bex56Bes
	zJ1Kvpq8MhEi4wslIwGvfOXVoJbgXxiBM6pg/3PzVfQA67lts6w7RqPKEUfHT9zVbesoI9xwg7C00
	Pqbzb+5VaBa+Q2QmXDk8AqE69kpKCnrJB6mf9HG9MsPl0h9A09cRKiClhqlJouvYKBc7dzt/49ROj
	251GuBcQMP+d7A+TCNM+VoGGzNamgssjW2/6SkbXjhnI7uo0dEgNWnZchOfe8KZ2IO3dNzmTQq88k
	F3AxaFn6RSUKSmK+lrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poPbX-00GYun-0i;
	Mon, 17 Apr 2023 14:13:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poPbV-00GYtp-0d
	for ath11k@lists.infradead.org;
	Mon, 17 Apr 2023 14:13:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33H8tAwO006609;
	Mon, 17 Apr 2023 14:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=DyeTitlKMgOzR9t9oQYxL+nfdGjKJlvEuLfb5WCEeTU=;
 b=CrtM57uehS9t2yTXfvFPsp8zErQzICskPPPKLYg5yJdEM+y0iKVzCA7EzjmnW/XvebN5
 clpwgeJjAtaSZ3Y3t+lG5PDk6vVbzdFcZrcVVPTuA6ftJbnSzEGTV+oYdhoJlUBwQ5qq
 dob5LCqy4QbQ9m4b1f8MLwohBnINMGaY0T9VYHo0D8LsHLzeKX+tdPTiQ4n9wIvtFpGD
 0JaR+MEkVmjuKTESi1P8t08x5ZjRQ5t32bbDVFVbOAhWrlvZLaRyMVa0CnpwcZ9h2Beq
 WNm6LmzSV30S3B9s5NVY3P8o7NXA0gr3Ws05vSMImQuTC7rpd/22sviNqMo+jSyZSnII 8Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q12strq3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 14:13:12 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33HEDBoG003380
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 14:13:11 GMT
Received: from [10.253.75.31] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 17 Apr
 2023 07:13:10 -0700
Message-ID: <c15e368e-2fea-a1d8-9c0d-db9278ded5e5@quicinc.com>
Date: Mon, 17 Apr 2023 22:13:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        <linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
 <d10b88b4-0bd7-a38c-e8d7-8982a281c4b3@quicinc.com>
 <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <e5adbed1524b27228c152ba14f78c550c8730baa.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pTSaSkIa6DuUp8ovzv0h2PtlccDewtUp
X-Proofpoint-ORIG-GUID: pTSaSkIa6DuUp8ovzv0h2PtlccDewtUp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_09,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=878 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304170127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_071313_239941_3907792C 
X-CRM114-Status: GOOD (  16.54  )
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

T24gNC8xMS8yMDIzIDM6MzggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVHVlLCAyMDIz
LTA0LTA0IGF0IDExOjI4ICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gTWF5IEkgYWxzbyBhZGQg
YSBmaWVsZCBzdWNoIGFzICJ1MTYgYWN0aXZlX2xpbmtzX2NvdW50IiBpbiBzdHJ1Y3QKPj4gd2lw
aHlfaWZ0eXBlX2V4dF9jYXBhYiwKPj4gYW5kIGFkZCBsb2dpYyBpbiBmdW5jdGlvbiBpZWVlODAy
MTFfc2V0X3ZpZl9saW5rc19iaXRtYXBzKCkgZm9yIHN0YXRpb24KPj4gbGlrZSB0aGlzID86Cj4+
IGlmIChhY3RpdmVfbGlua3NfY291bnQgJiYgaHdlaWdodDE2KGxpbmtzKSA8PSBhY3RpdmVfbGlu
a3NfY291bnQpCj4+ICAgwqDCoMKgIHRoZW4gc2RhdGEtPnZpZi5hY3RpdmVfbGlua3MgPSBsaW5r
czsKPj4KPiBBbHNvIGhlcmUsIG5vdCBzdXJlIGl0IG1ha2VzIHNlbnNlIGluIGNmZzgwMjExIGxl
dmVsPwo+Cj4gVGhvdWdoIEknbSBub3Qgc3VyZSB3aGF0IHRoZSBpZGVhIGhlcmUgaXMgYXQgYWxs
IC0geW91IGNhbiByZWZ1c2UgdG8KPiBsaW5rIHN3aXRjaCBldGMsIHdoYXQgd291bGQgeW91IHVz
ZSB0aGlzIGZvcj8KSWYgSSB1c2UgaWVlZTgwMjExX3NldF9hY3RpdmVfbGlua3MoKSwKdGhlbiBJ
IG5lZWQgYWRkIEJTU19DSEFOR0VEX0FTU09DIGFuZCBrZXkgZm9yIDJuZCBsaW5rIGluIGxvd2Vy
LWRyaXZlci4KCkkgd291bGQgbGlrZSB0byBhY3RpdmUgYWxsIGxpbmtzIHdoaWxlIGFzc29jLAp0
aGVuIEJTU19DSEFOR0VEX0FTU09DIGFuZCBrZXkgd2lsbCBhdXRvIHNldCBmb3IgdGhlIDJuZCBs
aW5rIHRvIApsb3dlci1kcml2ZXIgZnJvbSBtYWM4MDIxMS4KPgo+IFRoZW4gYWdhaW4sIHdlIGhh
dmVuJ3QgcmVhbGx5IGRlc2lnbmVkIG91dCBhbGwgdGhlIGxpbmsgc2VsZWN0aW9uIHN0dWZmLAo+
IGRvIHdlIHdhbnQgd3BhX3MgdG8gZG8gaXQsIGRyaXZlciB0byBkbyBpdCwgZXRjLj8gSGVuY2Ug
ZGVidWdmcy4gU28KPiBkZXBlbmRpbmcgb24gd2hhdCBlbmQgdXAgZG9pbmcgdGhlcmUsIHdlIHdp
bGwgb2J2aW91c2x5IG5lZWQgdG8KPiBhZHZlcnRpc2Ugc29tZSBsZXZlbCBvZiBsaW5rLWNvbmN1
cnJlbmN5IHRvIHVzZXJzcGFjZS4KPgo+IGpvaGFubmVzCgotLSAKYXRoMTFrIG1haWxpbmcgbGlz
dAphdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDExawo=
