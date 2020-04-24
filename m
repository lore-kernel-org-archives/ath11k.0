Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRuwX-0003TD-65
 for ath11k@lists.infradead.org; Fri, 24 Apr 2020 09:48:24 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/2] mac80211: enable TKIP when using encapsulation
 offloading
References: <1587720951-9222-1-git-send-email-murugana@codeaurora.org>
Date: Fri, 24 Apr 2020 12:47:59 +0300
In-Reply-To: <1587720951-9222-1-git-send-email-murugana@codeaurora.org>
 (Sathishkumar Muruganandam's message of "Fri, 24 Apr 2020 15:05:49
 +0530")
Message-ID: <87mu71gqpc.fsf@kamboji.qca.qualcomm.com>
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> writes:

> TKIP was disabled on encap offload mode since if TKIP MIC error
> reporting is not capable by the driver using encap offload mode,
> then TKIP countermeasures wont work.
>
> Enabling back TKIP bring-up in encap offload mode to leave the
> control with the driver to disable hw encap when it is not capable
> of TKIP MIC error reporting.
>
> Sathishkumar Muruganandam (2):
>   mac80211: enable TKIP when using encapsulation offloading
>   ath11k: add 802.3 undecap support to fix TKIP MIC error reporting

When you resend please increase the version to make it clear what is the
latest version. So this is actually v2, but no need to resend because of
this.

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
