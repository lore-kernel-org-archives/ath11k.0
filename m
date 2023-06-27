Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229E9EB64D9
	for <ath11k@archiver.kernel.org>; Tue, 27 Jun 2023 11:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1KESvN1vP/nNHnCaGmyR4drd4x+1AwHT2bBr/KHZog=; b=DGqju00/F0UamL
	f0x2HmcX+uWCPiNQIPvqQft4YPcawXsfSR3mvKgJoOaqDH5EHJK1suq4fhOA9+c7lDZcZZhgn1jIE
	j8aAU63muABQlj2VUu9f4Ei6SXOQ+CSmn7oo6QGwIHVf9m1rrHtpMXp1dhVm5n7p5pdAqC0lOYMTN
	h2TT8YI2Za3mdVjNfjDMhDdXxJ+xIVZ62KX5glVzSLHFoTMvIR7WZjvkrgYH4mifdWHcs4B3c3jfd
	V/Od+ueqsHOJNRtTAaeVMp1HSH8JrwaVt6tQovYuvnt2MJflhgAzE7QdvoVRWvR5snnhIcnVB7pM3
	1DpFEk7eXgUfHQI0fY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6Sy-00D1JM-2o;
	Tue, 27 Jun 2023 11:02:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE6Sv-00D1Ht-2E
	for ath11k@lists.infradead.org;
	Tue, 27 Jun 2023 11:02:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35R7O7pL002471;
	Tue, 27 Jun 2023 11:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lxZNVrCQko/pPbslGW3XRv9jq/ybp0nX5Ov9qGTlKXo=;
 b=l2hJIo0ssksDL4ORMapCdmOo8R6czbRmbKKxJiNfnf/ZZWZhj3BRqbTfSUPCZVx/mXaU
 QItisxy1A8Ml6aVD1XyKrRtz4cEKWMkPRMrjUNIJB1X4R0C+JmYSF0i8OxEum0Q/D8L2
 v7SWS1tQmF46WfHCZgmeWgkP23imO5wmmwCbCgVOuWdtpiaS5fOOTSzs3h9IdTJBIlYM
 QYXbKdFHvn8POp1crXJrp69RcXlT8Se4Xsxa96ADn8jQaCx15lw8XX7SNh6byYJ0Me2f
 qLhZxs5sKiUEViVZWdpyFKmNqNTw1dwgbMj1aGmDuI3hdCB1xUHanjeKmB9F3HqbnNS9 uQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rfcvtt54s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jun 2023 11:02:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35RB2NpQ026940
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jun 2023 11:02:23 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 27 Jun
 2023 04:02:22 -0700
Message-ID: <fbb20a27-2804-51af-c057-d117709f48e9@quicinc.com>
Date: Tue, 27 Jun 2023 19:02:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Wen Gong <quic_wgong@quicinc.com>
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
 <1c26c205-0240-7670-117d-02a7af068724@quicinc.com>
 <6f8db032286923845202c7d658f1d39db79a758c.camel@sipsolutions.net>
 <a7093d7a-0179-7b5f-cc61-a501331d35c6@quicinc.com>
 <c60af4eb116ed330e8035503fb7944f8853bcfa4.camel@sipsolutions.net>
 <b6314b61-0700-0e1c-7b39-21c305dc28b3@quicinc.com>
Content-Language: en-US
In-Reply-To: <b6314b61-0700-0e1c-7b39-21c305dc28b3@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nUqDT7WgT1mN-v9CdmXlBKsik5v8wf-d
X-Proofpoint-GUID: nUqDT7WgT1mN-v9CdmXlBKsik5v8wf-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_06,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 mlxscore=0 mlxlogscore=851 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306270100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_040233_892993_D75789D2 
X-CRM114-Status: GOOD (  26.89  )
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

T24gNi8yMS8yMDIzIDM6NTUgUE0sIFdlbiBHb25nIHdyb3RlOgo+IE9uIDYvMTUvMjAyMyAzOjU2
IFBNLCBKb2hhbm5lcyBCZXJnIHdyb3RlOgo+PiBPbiBUaHUsIDIwMjMtMDYtMTUgYXQgMTA6MjYg
KzA4MDAsIFdlbiBHb25nIHdyb3RlOgo+Pj4gT24gNi8xNS8yMDIzIDI6MzIgQU0sIEpvaGFubmVz
IEJlcmcgd3JvdGU6Cj4+Pj4gT24gV2VkLCAyMDIzLTA1LTI0IGF0IDE1OjQxICswODAwLCBXZW4g
R29uZyB3cm90ZToKPj4+Pj4gTWF5IEkgYWRkIGEgbmV3IG9wcyBpbiBzdHJ1Y3QgaWVlZTgwMjEx
X29wcz8gbGlrZSB0aGlzOgo+Pj4+Pgo+Pj4+PiB1MTYgYWN0aXZlX2xpbmtzKHN0cnVjdCBpZWVl
ODAyMTFfaHcgKmh3LCBzdHJ1Y3QgaWVlZTgwMjExX3ZpZiAKPj4+Pj4gdmlmLCB1MTYKPj4+Pj4g
bmV3X2xpbmtzKSIKPj4+Pj4KPj4+Pj4gdGhlbiBpZWVlODAyMTFfc2V0X3ZpZl9saW5rc19iaXRt
YXBzKCkgY2FsbCB0aGUgb3BzIHRvIGdldCB0aGUgCj4+Pj4+IGxpbmtzIGZvcgo+Pj4+PiBzdGF0
aW9uIGFuZCBzZXQgdGhlIHNkYXRhLT52aWYuYWN0aXZlX2xpbmtzIHdpdGggdGhlIHJldHVybiB2
YWx1ZSAKPj4+Pj4gZnJvbQo+Pj4+PiBsb3dlciBkcml2ZXIsCj4+Pj4+IGl0IG1lYW5zIGxvd2Vy
IGRyaXZlciB3aWxsIGR5bmFtaWMgc2VsZWN0IHRoZSBsaW5rcyBjb3VudCBhdCB0aGlzIAo+Pj4+
PiBtb21lbnQuCj4+Pj4+Cj4+Pj4+IElmIGxvd2VyIGRyaXZlciBub3QgcmVnaXN0ZXIgb3BzIGFj
dGl2ZV9saW5rcywgdGhlbiBrZWVwIGN1cnJlbnQgCj4+Pj4+IGxvZ2ljLgo+Pj4+Pgo+Pj4+IEkg
Z3Vlc3MgeW91IGNhbiBjYW4gc2VuZCBwYXRjaGVzIGZvciB3aGF0ZXZlciB5b3Ugd2FudCA6KQo+
Pj4+Cj4+Pj4gQnV0IEkgaGF2ZSBubyBpZGVhIHdoYXQgeW91J3JlIHRyeWluZyB0byBkbz8gV2h5
IHdvdWxkIHlvdSBuZWVkIHRvIAo+Pj4+IGhhdmUKPj4+PiBhIGNhbGxiYWNrPwo+Pj4gQ3VycmVu
dGx5IGRyaXZlciBjb3VsZCB1c2UgaWVlZTgwMjExX3NldF9hY3RpdmVfbGlua3NfYXN5bmMoKSB0
byBhY3RpdmUKPj4+IGxpbmtzIGFmdGVyIGNvbm5lY3Rpb24gY29tcGxldGVkLgo+PiBSaWdodC4K
Pj4KPj4+IEJ1dCBJIHdvdWxkIGxpa2UgdG8gYWxsb3cgZHJpdmVyIHRvIHNlbGVjdCBhY3RpdmUg
bGlua3MgaW4gYSBlYXJseSAKPj4+IHRpbWUsCj4+PiBpdCB3aWxsIGJlIG1vcmUgY29udmVuaWVu
dCBmb3IgZHJpdmVyLgo+PiBIb3cgc28/IEFsbCB5b3UgaGF2ZSB0byBkbyBpcyBsb29rIGZvciB0
aGUgY29ubmVjdGlvbiBiZWNvbWluZwo+PiBhdXRob3JpemVkIChlLmcuIHN0YSBzdGF0ZSBmb3Ig
dGhlIEFQIG1vdmluZyB0byBhdXRob3JpemVkKSBhbmQgdGhlbgo+PiBzZWxlY3RpbmcgdGhlIGxp
bmtzIHlvdSB3YW50LiBXZSd2ZSBhbHJlYWR5IGJlZW4gd29ya2luZyBvbiB0aGF0LCBpdCdzCj4+
IHJlYWxseSBlYXN5Pwo+IEl0IGlzIG1vcmUgY29tcGxleCBmb3IgYXRoMTJrIGRyaXZlcnMuCj4+
Cj4+IE9uIHRoZSBmbGlwLXNpZGUsIGl0IHdvdWxkIGJlIGhpZ2hseSBpbmNvbnZlbmllbnQgZm9y
IG1hYzgwMjExIHRvIHRyeSB0bwo+PiBlbmFibGUgbW9yZSBsaW5rcyAqZHVyaW5nKiB0aGUgYXNz
b2NpYXRpb24gcHJvY2VzcywgYW5kIGFjdHVhbGx5IGl0J3MKPj4gbm90IGV2ZW4gYWxsb3dlZCBi
eSBzcGVjIHVudGlsIHRoZSA0LXdheS1IUyBmaW5pc2hlcy4gU28gdGhlIGVhcmxpZXN0Cj4+IHBv
c3NpYmxlIHRpbWUgaXMgcHJldHR5IG11Y2ggd2hlbiB5b3UgY2FuIGp1c3QgZG8gaXQgaW4gdGhl
IGRyaXZlciBhcyBJCj4+IGp1c3QgZGVzY3JpYmVkLgo+Pgo+Pj4+IFdhcyB0aGlzIGZvciBsaW5r
IHNlbGVjdGlvbiBpbiB0aGUgZHJpdmVyPyBXZSBzaG91bGQgaGF2ZSBhIHBhdGNoCj4+Pj4gc29t
ZXdoZXJlIHRoYXQgYWRkcyBhIEJTU19DSEFOR0UgZmxhZyBmb3Igd2hlbiB0aGUgdmFsaWQgbGlu
a3MgY2hhbmdlLAo+Pj4+IHNvIHRoZSBkcml2ZXIgY2FuIHNlbGVjdCBvdGhlcnMuCj4+Pj4KPj4+
PiBqb2hhbm5lcwo+Pj4gWWVzLCBpdCBpcyBmb3IgbGluayBzZWxlY3Rpb24gaW4gZHJpdmVyIGF0
IGEgZWFybHkgdGltZSBiZWZvcmUKPj4+IGNvbm5lY3Rpb24gY29tcGxldGVkLgo+PiBUaGlzIGlz
IG5vdCByZWFsbHkgYWxsb3dlZCAuLi4gQXQgbGVhc3Qgbm90IHdpdGhvdXQgYWxzbyBmaW5kaW5n
IHdheXMgdG8KPj4gcmVhbGx5IHRyYW5zbWl0IHRoZSA4MDIuMVggYW5kIDQtd2F5LUhTIG9ubHkg
b24gdGhlIHJpZ2h0IGxpbmssIGV0Yy4KPiBZZXMsIEkgYWxzbyBmb3VuZCB0aGlzIGluIHNlY3Rp
b24gIjIuNy42LjEgR2VuZXJhbCLCoCBvZiBJRUVFIFA4MDIuMTFiZToKPiAiRm9yIE1MTywgaWYg
UlNOQSBoYXMgbm90IGJlZW4gZXN0YWJsaXNoZWQsIGVhY2ggbWVzc2FnZSBvZiB0aGUgNC13YXkg
Cj4gaGFuZHNoYWtlIHNoYWxsIGJlIHNlbnQgb24KPiB0aGUgc2FtZSBsaW5rIHVzZWQgYnkgdGhl
IGxhdGVzdCBleGNoYW5nZSBvZiBzdWNjZXNzZnVsIAo+IChSZSlBc3NvY2lhdGlvbiBSZXF1ZXN0
L1Jlc3BvbnNlIGZyYW1lcy4iCj4KPiBGb3IgYXRoMTJrIGRyaXZlcnMsIG9ubHkgdGhlIHByaW1h
cnkgbGluayh0aGUgbGluayB1c2VkIGJ5IHRoZSBsYXRlc3QgCj4gZXhjaGFuZ2Ugb2Ygc3VjY2Vz
c2Z1bCAoUmUpQXNzb2NpYXRpb24KPiBSZXF1ZXN0L1Jlc3BvbnNlIGZyYW1lcykgaXMgYWN0aXZl
IGJlZm9yZSBrZXkgaW5zdGFsbGVkLCBzbyB0aGUgODAyLjFYIAo+IGFuZCA0LXdheS1IUyB3aWxs
IGFsd2F5cyBzZW50IG9uCj4gdGhlIHByaW1hcnkgbGluaywgc28gaXQgd2lsbCBtZWV0IHRoZSBy
dWxlIGFib3ZlIG9mIHNlY3Rpb24gIjIuNy42LjEgCj4gR2VuZXJhbCIuCj4KPiBJdCBtZWFuczog
bG93ZXIgZHJpdmVyIHdpbGwgZW5zdXJlIHRoZSBydWxlIHdoZW4gaXQgaW1wbG1lbnRlZCB0aGUg
Cj4gYWN0aXZlX2xpbmtzIGNhbGxiYWNrIHN1Y2ggYXMgYXRoMTJrLgpKb2hhbm5lcywgZG8geW91
IGhhdmUgbW9yZSBjb21tZW50cyBmb3IgbXkgYW5zd2VyIGFib3ZlP/CfmIEKPj4+IENvdWxkIHlv
dSB0ZWxsIGRldGFpbCBhYm91dCBob3cgdGhlIEJTU19DSEFOR0UgZmxhZyB3b3Jrcz/wn5iBCj4+
IFRoZSB3b3JrIGlzbid0IGNvbXBsZXRlIHlldCwgYnV0IGJhc2ljYWxseSBpdCBqdXN0IGNhbGxz
IHRoZSBjYWxsYmFjawo+PiB3aGVuZXZlciB0aGUgdmFsaWRfbGlua3MgY2hhbmdlZCwgc2F5IGJ5
IGxpbmstcmVjb25maWd1cmF0aW9uLgo+Pgo+PiBqb2hhbm5lcwoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
