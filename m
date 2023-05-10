Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B424C77B7D
	for <ath11k@archiver.kernel.org>; Wed, 10 May 2023 12:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gwCfFY0IWQsmUoM4Jv8gQyuWnGyp96du4aG3ZP9Z0Y=; b=cmeequCw/dHHJb
	ejNSa5jzeipsdGKspjFdrpjYyot/9EoqR5nMOoM+83lBJmacNjQ5Tl7hm1jfc7om813LC2afC/na0
	qoHRwUeK8o3gplriBS34YXMm7sms50vpMgb/QvNKwn9uVrPJBOFbycTX01mF13CRjMq86htdLc5HH
	b4VTq9OP6p5a5arwUlNY6NT+naI4GQ+uJHVvEe9qpZuT3EiMufVsvKfjYcZk/HGkzYZdfUyByRO9X
	LWTj/p0vr3+NKJKdDNvJeCFQAKXuFHOU1DIgwr9RggYvpXHeDr8fF8GN+4s5s914Nhi6S8GphILQl
	kTU4nG1sjpthhycg7GXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwisZ-0068WK-2K;
	Wed, 10 May 2023 12:25:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwisW-0068VJ-39
	for ath11k@lists.infradead.org;
	Wed, 10 May 2023 12:25:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34ABD4dO009190;
	Wed, 10 May 2023 12:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=kY+qCZY9zsqCirQ76ORKCt5A0pN2zqswkApy+5L+cDQ=;
 b=KsLn+sVZ1ei0JRZjtg9IWcg61lPTabr1Bt3p5sQRSxZ4kijrDimk5MnjGSAp6PyM+BBA
 +/MELtUoqFfqJDbxjnv6tvKZ8dmbJIBbpWV4H6Q1s6Gtx+bKm/YhD1ZvPAQ3wyKHtonH
 HJqSAp/jbys2frSjSoLIAzpEIzO/VBY7TujV5nOuCvsATFkv2E3rpP1YFUN/LniUF7VU
 uY5g+GPooLWtDsejPIJUiI/OAGZKIVtA22vc1tmSV+a/MsVjYq0BRGLFFBu/UCB7APCa
 q5LaZZrSHEHAjc7qY0L5qu+GsN1Kif1Vev5fAYcvP3yRzfFzEyxRQmpExHSCOyW5FrcF Gw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qfrvm22q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 12:25:07 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34ACP6Ce013388
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 May 2023 12:25:06 GMT
Received: from [10.253.78.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 05:25:05 -0700
Message-ID: <de1f920b-66f5-fb0a-47a5-622ba6bbbff8@quicinc.com>
Date: Wed, 10 May 2023 20:25:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
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
 <5e3ec5f8-1462-5de6-2b5a-4cf62f23deb7@quicinc.com>
 <0e7023062f44d0ea68625c27cb13731d17857311.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <0e7023062f44d0ea68625c27cb13731d17857311.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BvGK_38CqSnf3veBSI6ZM44VL-9LWegt
X-Proofpoint-GUID: BvGK_38CqSnf3veBSI6ZM44VL-9LWegt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=899 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305100097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_052509_133622_35576EB2 
X-CRM114-Status: GOOD (  15.04  )
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

T24gNS8xMC8yMDIzIDc6MjQgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gV2VkLCAyMDIz
LTA1LTEwIGF0IDE5OjA2ICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gT24gNC8xMS8yMDIzIDM6
MzggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+PiBPbiBUdWUsIDIwMjMtMDQtMDQgYXQgMTE6
MjggKzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+Pj4+IE1heSBJIGFsc28gYWRkIGEgZmllbGQgc3Vj
aCBhcyAidTE2IGFjdGl2ZV9saW5rc19jb3VudCIgaW4gc3RydWN0Cj4+Pj4gd2lwaHlfaWZ0eXBl
X2V4dF9jYXBhYiwKPj4+PiBhbmQgYWRkIGxvZ2ljIGluIGZ1bmN0aW9uIGllZWU4MDIxMV9zZXRf
dmlmX2xpbmtzX2JpdG1hcHMoKSBmb3Igc3RhdGlvbgo+Pj4+IGxpa2UgdGhpcyA/Ogo+Pj4+IGlm
IChhY3RpdmVfbGlua3NfY291bnQgJiYgaHdlaWdodDE2KGxpbmtzKSA8PSBhY3RpdmVfbGlua3Nf
Y291bnQpCj4+Pj4gICAgwqDCoMKgIHRoZW4gc2RhdGEtPnZpZi5hY3RpdmVfbGlua3MgPSBsaW5r
czsKPj4+Pgo+Pj4gQWxzbyBoZXJlLCBub3Qgc3VyZSBpdCBtYWtlcyBzZW5zZSBpbiBjZmc4MDIx
MSBsZXZlbD8KPj4+Cj4+PiBUaG91Z2ggSSdtIG5vdCBzdXJlIHdoYXQgdGhlIGlkZWEgaGVyZSBp
cyBhdCBhbGwgLSB5b3UgY2FuIHJlZnVzZSB0bwo+Pj4gbGluayBzd2l0Y2ggZXRjLCB3aGF0IHdv
dWxkIHlvdSB1c2UgdGhpcyBmb3I/Cj4+Pgo+Pj4gVGhlbiBhZ2Fpbiwgd2UgaGF2ZW4ndCByZWFs
bHkgZGVzaWduZWQgb3V0IGFsbCB0aGUgbGluayBzZWxlY3Rpb24gc3R1ZmYsCj4+PiBkbyB3ZSB3
YW50IHdwYV9zIHRvIGRvIGl0LCBkcml2ZXIgdG8gZG8gaXQsIGV0Yy4/IEhlbmNlIGRlYnVnZnMu
IFNvCj4+PiBkZXBlbmRpbmcgb24gd2hhdCBlbmQgdXAgZG9pbmcgdGhlcmUsIHdlIHdpbGwgb2J2
aW91c2x5IG5lZWQgdG8KPj4+IGFkdmVydGlzZSBzb21lIGxldmVsIG9mIGxpbmstY29uY3VycmVu
Y3kgdG8gdXNlcnNwYWNlLgo+PiBTbyB3aWxsIHlvdSBwbGFuIHRvIGRvIHNvbWV0aGluZyB0byBs
ZXQgd3BhX3MvdXNlcnNwYWNlIGFwcAo+PiBhY3RpdmUvZGVhY3RpdmUgbGlua3M/Cj4+Cj4+IE9y
IHlvdSBhbHJlYWR5IGhhdmUgaW1wbGVtZW50ZWQgdGhhdD8KPj4KPiBObyBwbGFucyByaWdodCBu
b3csIGFuZCBob25lc3RseSBub3Qgc3VyZSB3aGF0IHRoZSByaWdodCB0aGluZyBldmVuIGlzLgpP
Sy4gRm9yICJhZHZlcnRpc2Ugc29tZSBsZXZlbCBvZiBsaW5rLWNvbmN1cnJlbmN5IHRvIHVzZXJz
cGFjZSIsIGRvIHlvdSAKaGF2ZSBhbnkgcGxhbi9pZGVhPwo+Cj4gam9oYW5uZXMKCi0tIAphdGgx
MWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
