Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168F9EEEC3B
	for <ath11k@archiver.kernel.org>; Fri, 13 Sep 2024 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzmiL2pwOSRceXiRSuVBLKwQ8Db9q204UXrVYKw+CUo=; b=cMuse0fRczJgWA/+PUDFP2H86Y
	uRj5bo0gsJ+i88yh44YJ0NztPBOZ3BlofUVqNzNPz8vo/U627e4YYtqHWLkn5toWgfomXEgMo5P5w
	Z5geQHE8FArOWKFwnQ5JU7AqYdjsDHSzFdmPqALIrBf3+W5wFBHZh7pINTWcYOENSEG5kVH9I7xDJ
	Q1kDICxulI3KgqiwzlzZFWTV2wKQdaqSzJKj2SnD7xaJK0Jr3SeLOedj8CLFrahPGDv8J1XC61F6J
	QIapcFTwJfw3/TS/Cth9/K6eRW18dQDCDrkFlsXQ1YNeWHk8FYKFpdk7HM5yGBMNlKqu4K9gOOtWO
	jWF8b2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp66J-0000000Fzik-2KQm;
	Fri, 13 Sep 2024 13:12:39 +0000
Received: from e3i110.smtp2go.com ([158.120.84.110])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp66G-0000000Fzi6-0hF8
	for ath11k@lists.infradead.org;
	Fri, 13 Sep 2024 13:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1726233143; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=hzmiL2pwOSRceXiRSuVBLKwQ8Db9q204UXrVYKw+CUo=;
 b=0K70lKngXPy1kkqal2TRcRpmsfsHIBjLKxQrGTKQmMYMcVow4jEojrKryJAyKiSGr8AwV
 tH632+9skQtoxx207LkzbHMNk0GICzTrqOCv5ZdsCMA9s2dkukjuqatqrUekU340n247lrb
 WTv/ZwTmkNdj0i10v4toEGLjCVCK2HozPWOQEjHK03trk/2LulM1h89hQ7J+lvbC0GOQzp/
 IIutOG0SbrMiYTubfTkRg/v6+XPhSV1JIU9tOfoyTs/5htZsAGguClR2q2dBDeVqOCNGN4d
 3K3IUqdK0aJHFhZSy+hCulYV0G7oPYSnF9rwwAVjLPES4loFxShclsTTyegA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1726233143; h=from : subject
 : to : message-id : date;
 bh=hzmiL2pwOSRceXiRSuVBLKwQ8Db9q204UXrVYKw+CUo=;
 b=fswdgZuiV01P3T/+gBUw0UGHASKYNIevqe6BfinBoWWdfC71oweFpyV8Egv5fblmueO8y
 z4zZzoHQdIq4rH5+b7GPptB1VVh7BfdRgrtsXWido3mnIZ7IyBAKNJ8kNNVDWh/Xd0gDCJh
 UfnP5oDpZSXQSPGIVPIkkjU0R+kf30UlSWBL5z+mf5Vb+mnjnQx6PBMMFdveFI+pnypmq3S
 NESfR8DI3CnenZu7KBxf+OVZ7pM4U55ZW5iwOrEf1/aVP+4dm3dxEsBJV+TH7n3c8UCwGwt
 CKdXZ78Qdspp2tFPncuxeanUCIks75hGgkK3WyIgREGJ9UGDrdOsLwZ2ESJA==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1sp65z-4o5NDgriEI1-m6jM;
	Fri, 13 Sep 2024 13:12:19 +0000
Date: Fri, 13 Sep 2024 15:13:50 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: "Lindner, Frank" <Frank.Lindner@ghmt.de>,
	"ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: : ath11k monitor mode
Message-ID: <ZuQ6jnHyXPZOiixu@pilgrim>
References: <FRYP281MB0160287D5A3D8F7130707BDAEB1B2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <43b0cdc0-f489-410a-a702-5a5092b9bc18@quicinc.com>
 <8ab6d337-1c2b-40d8-80a4-2a1ca4092987@quicinc.com>
 <d93be101-4aa4-414c-bb1f-292d3f8fe27c@quicinc.com>
 <FRYP281MB0160C7239CB63E4061D4CDB4EB1A2@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <FRYP281MB0160FB54135444832AA77E6AEBC22@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <841700e2-fb8b-4700-b794-17ea9abcb011@quicinc.com>
 <669135a4.170a0220.8fbf0.26d5@mx.google.com>
 <FRYP281MB016057FD5857443FBBB1DD28EB652@FRYP281MB0160.DEUP281.PROD.OUTLOOK.COM>
 <258cd677-edb1-46a3-9e51-9f6a101c5a2d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <258cd677-edb1-46a3-9e51-9f6a101c5a2d@quicinc.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616szYUpaV4vZ
X-smtpcorp-track: dfu3YYmbuCsr.RK5XZW7qI1Ap.U0RA7gJl__r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_061236_647072_8352DB63 
X-CRM114-Status: GOOD (  12.77  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Fri, Sep 13, 2024 at 06:11:33PM +0800, Kang Yang wrote:
> 
> 
> On 9/13/2024 2:59 PM, Lindner, Frank wrote:
> > Hi everyone,
> > 
> > is there any update on the topic ath11k monitor mode?
> > We prefer to use QCA chipsets, but currently its not possible.
> > 
> 
> For QCN9074, full monitor mode should work with below patch-set.
> https://patchwork.kernel.org/project/linux-wireless/cover/20240913100708.756-1-quic_kangyang@quicinc.com/
> 

Does full monitor works without [0]. Last time I checked it didn't on
QCN9074 with WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1.

Thanks

[0]: https://lore.kernel.org/ath11k/505773d9e20d14c22ce1a56ac640ba442b29ae4a.1700731974.git.repk@triplefau.lt/

-- 
Remi

