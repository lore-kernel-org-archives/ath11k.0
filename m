Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207A2C77B7F
	for <ath11k@archiver.kernel.org>; Thu, 11 May 2023 11:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+l+4EHDCYCeRNi7WhroMIH9Ii04dgC4Ge3G1M/QwjhM=; b=DPBXZrNvNEG5/b
	qFkOS+IN3fEzvJtJmvukrqg70OLiayIt4p/PUwc7DGEHMXtULzEhg9GpLOHKuINBVRmwqHUYirtlD
	DP71bgCtJa5qB1tbogny3zL8CDG0te9jHU/3v+s60Vt+M3Qd7Fb4gddhboJmC6FbUrscU133gXbEr
	2+aUEDBo9Sey2wdG8uYh0Rea+W0MRCnCPCRn3LaTwusy+7gQvcUKvR1SaiPNe3Hys9q9A0OaMQHJo
	qWsdM2va7552TO6LOUrcPcMHfjqGtinr7sj2BigU2yEb+n+xsYdwTCyRRXp9PyU/FdlZMPtCIwbMX
	FZQ9XVpgG93381FtB7Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px43D-008bw4-2B;
	Thu, 11 May 2023 11:01:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px43A-008bvY-37
	for ath11k@lists.infradead.org;
	Thu, 11 May 2023 11:01:34 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BACVWU032335;
	Thu, 11 May 2023 11:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WKy8kmBhpVPjti8A8Z4JIB9qnscpRMGvPXjfG+OpgcQ=;
 b=Eqafg5qDJVO5H2dR0rO80xfjrtwNTPyV0gTIOrWqLJ25PLECAYBnQ2hwRNmVAoPZiaHK
 GCHWscXMDGioaqQpjoOa9GWzq+Fue2KS5zQwxrHaTDU1QB9DTM0dYR2gG4XYMadLJnvY
 NAkH56rtLN6BhEnt6+NB6ApNspxzksXmF6U6s5n0wvKet0WnJGZdljYidxDG8lOOXnN3
 LwCOMD40FH9g68strwCStG4uYdzhQLkSqVScorGpniidYBs/9/qGigz2OfOnPM52nKyB
 Y2MYS9vDRT4qG80yxdyDytatG2bnkqMcvbPHUJgDkNpOo2qfiVWaDSdV4LsVvUblPBp7 Xw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qged2j0w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 11:01:28 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34BB1QhY009435
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 11:01:26 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 11 May
 2023 04:01:25 -0700
Message-ID: <2d3a6578-68c5-a0f3-b18b-bce2e67d3fdc@quicinc.com>
Date: Thu, 11 May 2023 19:01:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: parsing the multi-link element with STA profile wifi: mac80211:
 support MLO authentication/association with one link
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
CC: <ath11k@lists.infradead.org>
References: <48715509-62fd-2307-e38f-176234b482c1@quicinc.com>
 <f240b33d507daf898480b0a11eb27d4475e45164.camel@sipsolutions.net>
 <571d8ecf-2ca6-8b7b-6e15-be12c56e9f88@quicinc.com>
 <e40ee96ab2a8d9d079d3a06b7b1c615ab25a2403.camel@sipsolutions.net>
 <2842f57c-e383-fb9e-d994-95336cb65e0d@quicinc.com>
 <6a33a41b5aa6c98d95ff934fbb6a10dfe78e6e6e.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <6a33a41b5aa6c98d95ff934fbb6a10dfe78e6e6e.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IBxAePh062ioRr7AhY3I3HG7yodxVpkS
X-Proofpoint-GUID: IBxAePh062ioRr7AhY3I3HG7yodxVpkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_07,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_040133_119504_7E20B93A 
X-CRM114-Status: GOOD (  14.22  )
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

T24gNC8xOC8yMDIzIDU6MTEgUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4gT24gVHVlLCAyMDIz
LTA0LTE4IGF0IDE3OjAyICswODAwLCBXZW4gR29uZyB3cm90ZToKPj4gT24gNC8xOC8yMDIzIDQ6
NDggUE0sIEpvaGFubmVzIEJlcmcgd3JvdGU6Cj4+PiBIaSwKPj4+Cj4+Pj4gTXkgY2FzZSBpczoK
Pj4+PiBXaGVuIGNvbm5lY3Qgd2l0aCAyIGxpbmtzIEFQLCB0aGUgY2ZnODAyMTFfaG9sZF9ic3Mo
KSBpcyBjYWxsZWQgYnkKPj4+PiBjZmc4MDIxMV9tbG1lX2Fzc29jKCkKPj4+PiBmb3IgZWFjaCBC
U1Mgb2YgdGhlIDIgbGlua3MsCj4+Pj4KPj4+PiBXaGVuIGFzc3NvY1Jlc3AgZnJvbSBBUCBpcyBu
b3Qgc3VjY2VzcyhzdWNoIGFzIHN0YXR1c19jb2RlPT0xKSwgdGhlCj4+Pj4gaWVlZTgwMjExX2xp
bmtfZGF0YSBvZiAybmQgbGluayhzZGF0YS0+bGlua1tsaW5rX2lkXSkKPj4+PiBpcyBOVUxMIGJl
Y2F1c2UgaWVlZTgwMjExX2Fzc29jX3N1Y2Nlc3MoKS0+aWVlZTgwMjExX3ZpZl91cGRhdGVfbGlu
a3MoKQo+Pj4+IGlzIG5vdCBjYWxsZWQuCj4+Pj4KPj4+PiBUaGVuIHN0cnVjdCBjZmc4MDIxMV9y
eF9hc3NvY19yZXNwIHJlc3AgaW4gY2ZnODAyMTFfcnhfYXNzb2NfcmVzcCgpIGFuZAo+Pj4+IHN0
cnVjdCBjZmc4MDIxMV9jb25uZWN0X3Jlc3BfcGFyYW1zIGNyIGluIF9fY2ZnODAyMTFfY29ubmVj
dF9yZXN1bHQoKQo+Pj4+IHdpbGwgb25seSBoYXZlIHRoZSBkYXRhIG9mCj4+Pj4gdGhlIDFzdCBs
aW5rLCBhbmQgZmluYWxseSBjZmc4MDIxMV9jb25uZWN0X3Jlc3VsdF9yZWxlYXNlX2Jzc2VzKCkg
b25seQo+Pj4+IGNhbGwgY2ZnODAyMTFfdW5ob2xkX2JzcygpCj4+Pj4gZm9yIHRoZSAxc3QgbGlu
aywgdGhlbiBCU1Mgb2YgdGhlIDJuZCBsaW5rIHdpbGwgbmV2ZXIgZnJlZSBiZWNhdXNlIGl0cwo+
Pj4+IGhvbGQgaXMgYXdsYXlzID4gMCBub3cuCj4+PiBIYWgsIHllcywgb3VjaC4KPj4+Cj4+Pj4g
SSBmb3VuZCBpdCBpcyBub3QgZWFzeSB0byByZWZpbmUgaXQsIHNvIGRvIHlvdSBoYXZlIGFueSBh
ZHZpc2UvaWRlYT8KPj4+Pgo+Pj4+IGZvciAobGlua19pZCA9IDA7IGxpbmtfaWQgPCBJRUVFODAy
MTFfTUxEX01BWF9OVU1fTElOS1M7IGxpbmtfaWQrKykgewo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKg
IHN0cnVjdCBpZWVlODAyMTFfbGlua19kYXRhICpsaW5rOwo+Pj4+Cj4+Pj4gICAgwqDCoMKgwqDC
oMKgwqAgbGluayA9IHNkYXRhX2RlcmVmZXJlbmNlKHNkYXRhLT5saW5rW2xpbmtfaWRdLCBzZGF0
YSk7Cj4+Pj4gICAgwqDCoMKgwqDCoMKgwqAgaWYgKCFsaW5rKQo+Pj4+ICAgIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29udGludWU7Cj4+Pj4KPj4+PiAgICDCoMKgwqDCoMKgwqDCoCBpZiAoIWFz
c29jX2RhdGEtPmxpbmtbbGlua19pZF0uYnNzKQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGludWU7Cj4+Pj4KPj4+PiAgICDCoMKgwqDCoMKgwqDCoCByZXNwLmxpbmtzW2xpbmtf
aWRdLmJzcyA9IGFzc29jX2RhdGEtPmxpbmtbbGlua19pZF0uYnNzOwo+Pj4+ICAgIMKgwqDCoMKg
wqDCoMKgIHJlc3AubGlua3NbbGlua19pZF0uYWRkciA9IGxpbmstPmNvbmYtPmFkZHI7Cj4+Pj4g
ICAgwqDCoMKgwqDCoMKgwqAgcmVzcC5saW5rc1tsaW5rX2lkXS5zdGF0dXMgPSBhc3NvY19kYXRh
LT5saW5rW2xpbmtfaWRdLnN0YXR1czsKPj4+Pgo+Pj4gQnV0IGlzIGl0IHJlYWxseSBzbyBoYXJk
PyBXZSBvbmx5IG5lZWQgbGluayBmb3IgbGluay0+Y29uZi0+YWRkciwgYW5kIHdlCj4+PiBjYW4g
dXNlIGFzc29jX2RhdGEtPmxpbmtbbGlua19pZF0uYWRkciBmb3IgdGhhdCBpbnN0ZWFkLCBubz8g
V2UgbmVlZCB0bwo+Pj4gc3RvcmUgdGhvc2UgbG9jYWxseSB0byBhdm9pZCBhIHVzZS1hZnRlci1m
cmVlLCBidXQgdGhhdCdzIGF0IG1vc3QgMTUKPj4+IGFkZHJlc3NlcyBvbiB0aGUgc3RhY2ssIHdo
aWNoIHNlZW1zIGFjY2VwdGFibGU/Cj4+Pgo+Pj4gT2ggYW5kIHRoZXJlJ3MgdGhlIHVhcHNkIHN0
dWZmIGJ1dCB0aGF0IG9ubHkgbWF0dGVycyBpbiB0aGUgc3VjY2VzcyBjYXNlCj4+PiBhbnl3YXku
IEluIGZhY3QgSSdtIG5vdCBldmVuIHN1cmUgdGhlIGFkZHJlc3MgbWF0dGVycyBpbiB0aGUKPj4+
IHVuc3VjY2Vzc2Z1bCBjYXNlIGJ1dCB3ZSBoYXZlIGl0IHByZXR0eSBlYXNpbHkuCj4+Pgo+Pj4g
am9oYW5uZXMKPj4gT0suIFNvIEkgZ3Vlc3MgeW91IGFscmVhZHkgaGF2ZSBnb29kIHdheSB0byBy
ZWZpbmUgaXQ/Cj4+Cj4gTm8sIG5vdCByZWFsbHksIHdhcyBqdXN0IHRoaW5raW5nIG91dCBsb3Vk
IGhlcmUgOikKPgo+IGpvaGFubmVzCgpIaSBKb2hhbm5lcywgaWYgeW91IGhhdmUgYW55IHBhdGNo
IHRvIGZpeCBpdCwgSSBjYW4gZG93bmxvYWQgYW5kIHRlc3QuCgoKLS0gCmF0aDExayBtYWlsaW5n
IGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
