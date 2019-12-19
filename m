Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail25.static.mailgun.info ([104.130.122.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihvoY-0005aU-3d
 for ath11k@lists.infradead.org; Thu, 19 Dec 2019 13:26:03 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RESEND 6/9] ath11k: add debugfs for TWT debug calls
References: <20191204053713.3064-1-john@phrozen.org>
 <20191204053713.3064-7-john@phrozen.org>
 <0101016ecf7e75e3-b26c2edc-e278-4fbc-97d5-fc7f678c240f-000000@us-west-2.amazonses.com>
Date: Thu, 19 Dec 2019 15:25:55 +0200
In-Reply-To: <0101016ecf7e75e3-b26c2edc-e278-4fbc-97d5-fc7f678c240f-000000@us-west-2.amazonses.com>
 (vthiagar@codeaurora.org's message of "Wed, 4 Dec 2019 06:00:03
 +0000")
Message-ID: <87eex078gs.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: vthiagar@codeaurora.org
Cc: linux-wireless-owner@vger.kernel.org, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, John Crispin <john@phrozen.org>

vthiagar@codeaurora.org writes:

> On 2019-12-04 11:07, John Crispin wrote:
>> These new debugfs files allow us to manually add/del/pause/resume TWT
>> dialogs for test/debug purposes.
>>
>
> Information such as how these debugfs entries are supposed to be used
> could be helpful.

Yes, please always add instructions how the debugfs file is supposed to
be used. Not only it helps the users but makes the review easier as
well.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
